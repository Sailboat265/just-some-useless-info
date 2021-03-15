// This is an example code to send a HTTP request to an URL
// with the ability to authenticate itself with client certificate

// You will need Alamofire module
import Alamofire

func MakeRequest(dest_url: URL){
  AF.request(dest_url, method: .get, encoding: JSONEncoding.default)
        .authenticate(with: GetCert())
        .response{ ( responseData ) in
            print(responseData)
        }
}
