// Example code to import p12 client certificate and returns it to the string.
// Reference code taken from aLosada_7, link : https://developer.apple.com/forums/profile/aLosada_7
// Original thread: https://developer.apple.com/forums/thread/657822

func GetCert() -> URLCredential {
    let pathToCert = Bundle.main.path(forResource: "your-cert-file-name", ofType: "p12")
    let localCertificate = NSData(contentsOfFile: pathToCert!)!

    let options = [String(kSecImportExportPassphrase):"your-cert-password-here"]
    var items: CFArray? = nil
    let result = SecPKCS12Import(localCertificate, options as CFDictionary, &items)

    if (result != errSecSuccess) {
        debugPrint(result)
    }

    let info = (items! as NSArray).firstObject! as! NSDictionary
    let identity = info[String(kSecImportItemIdentity)] as! SecIdentity

    return URLCredential(identity: identity, certificates: nil, persistence: .forSession)
}
