//
//  FirstViewController.swift
//  SwipeSpanish
//
//  Created by Cobo, Javier on 12/12/15.
//  Copyright © 2015 Cobo, Javier. All rights reserved.
//

import UIKit

let BASE_URL = "https://api.flickr.com/services/rest/"
let METHOD_NAME:String! = "flickr.photos.search"
let API_KEY:String! = "0693969f57676ff5e48db06d2ba62027"
let GALLERY_ID:String! = "5704-72157622566655097"
let EXTRAS:String! = "url_m"
let DATA_FORMAT:String! = "json"
let SAFE_SEARCH:String!="1"
let NO_JSON_CALLBACK:String! = "1"
let SORT = "relevance"

class FirstViewController: UIViewController {
    
//Reference our Struct here
    let wordStruct = Words()
    
    var photoArray2: AnyObject! = [String: AnyObject]()
    
    var iNamey = [String]()
    var iImage = [String]()
    var iImageUrl = [NSURL]()
    
    var counter=0;
    
    @IBOutlet weak var imageDisplayOutlet: UIImageView!
    
    @IBOutlet weak var spanishWordLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//Run our randomArray function from Struct here to populate first image and Spanish word
        let randomArray = self.wordStruct.randomArray()
        
//Assign what word is being searched for on Flickr, English word is index 1 in array
        let word:String = randomArray[1]
        
        //        print(word)

//Assign what word is being shown to user on app, Spanish word is index 0 in array
        self.spanishWordLabel.text = randomArray[0]
        
        var methodArguments = [
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": word,
            "safe_search": SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK,
            "sort": SORT
        ]
        if methodArguments.isEmpty {
            
        }else {
            self.getImageFromFlickrSearch(methodArguments)
        }
        // Do any additional setup after loading the view, typically from a nib.
//        https://api.flickr.com/services/rest/?method=flickr.test.echo&name=value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func escapedParameters(parameters: [String : String!]) -> String! {
        var urlVars = [String]()
        for (key, value) in parameters {
            let stringValue = "\(value)"
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            urlVars += [key + "=" + "\(escapedValue!)"]
        }
        return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
    }
    
    
    func getImageFromFlickrSearch(methodArguments: [String : String!]) {
        let session = NSURLSession.sharedSession()
        let urlString = BASE_URL + escapedParameters(methodArguments)
        print(urlString)
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            if let error = downloadError {
                print("Could not complete the request \(error)")
            } else {
                var parsingError: NSError? = nil
                let parsedResult: AnyObject!
                do {
                    parsedResult = try
                        NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                }
                catch let error as NSError {
                    parsingError = error
                    parsedResult = nil
                } catch {
                    fatalError()
                }
                
                if let photosDictionary = parsedResult.valueForKey("photos") as? NSDictionary {
                    if let photoArray = photosDictionary.valueForKey("photo") as? [[String: AnyObject]] {
                        for (var index = 0; index < photoArray.count; ++index ){
                            let photoDictionary = photoArray[index] as [String:AnyObject]
                            
                            let photoTitle = photoDictionary["title"] as? String
                            var imageUrlString = photoDictionary["url_m"] as? String
                            if(imageUrlString==nil){
                                
                            }else {
                                let imageURL = NSURL(string: imageUrlString!)
                                self.iNamey.append(photoTitle!)
                                self.iImage.append(imageUrlString!)
                                self.iImageUrl.append(imageURL!)
                            }
                            
                        }
                       
                        /* Grab a single, random image */
                   let randomPhotoIndex = Int(arc4random_uniform(UInt32(photoArray.count)))
                        
                       let photoDictionary = photoArray[randomPhotoIndex] as [String: AnyObject]
                    //    let photoDictionary = photoArray[0] as [String: AnyObject]
                       
                        /* Get the image url and title of random image */
                        let photoTitle = photoDictionary["title"] as? String

                        let imageUrlString = photoDictionary["url_m"] as? String
                        let imageURL = NSURL (string: imageUrlString!)
                        
                        /* If an image exists at the url, set the image and title to storyboard*/
                        
                        if let imageData = NSData(contentsOfURL: imageURL!) {
                            dispatch_async(dispatch_get_main_queue(), {
                                self.imageDisplayOutlet.image = UIImage(data: imageData)
                                self.imageDisplayOutlet.contentMode = .ScaleAspectFit
                                self.imageDisplayOutlet.clipsToBounds = true
                             /*   if we want to set a title, we can set it here:
                                self.titleLabel.text = photoTitle */
                            
                                
                            })
                        
                        }
                        
                        
                        else {
                            print("Image does not exist at \(imageURL) or can't find key 'photo' in \(photosDictionary) or in \(parsedResult)")
                        }
                    }
                }
                
                /* 9 - Resume (execute) the task */

            }
        }
          task.resume()
    }
    
                   /*     if let imageData = NSData(contentsOfURL!) {
                            dispatch_async(dispatch_get_main_queue(), {
                                self.mainImg.image = UIImage(data: imageData)
                                self.titleLabel.text = photoTitle
                            })
                        } else {
                            print("image does not exist at \(imageURL)")
                        }else {
                            print("Cannot find key 'photo' in \(photosDictionary)")
                        }else {
                            print("Cannot find key 'photos' in \(parsedResult)"
                    
                        
                    */
                    
                    
            
    func nextPerson(){
        /* If image exists at url, set the image and title */
        if let imageData = NSData(contentsOfURL: iImageUrl[counter]) {
            dispatch_async(dispatch_get_main_queue(), {
                self.imageDisplayOutlet.image = UIImage(data: imageData)
              /* if we want to include title:  self.titleLabel.text = self.iNamey[self.counter] */
                self.counter++
                if(self.counter==self.iNamey.count){
                    self.counter=0;
                }
            })
        } else {
            print("Image does not exist at \(iImageUrl[0])")
        }
    } // end of func nextPerson()

    
    
    
    
    
    
    
//Button for user to click for next random word
    @IBAction func searchButton(sender: AnyObject) {
        
        let randomArray = self.wordStruct.randomArray()
        
//Assign what word is being searched for on Flickr, English word is index 1 in array
        let word:String = randomArray[1]

//        print(word)
        
//Assign what word is being shown to user on app, Spanish word is index 0 in array
        self.spanishWordLabel.text = randomArray[0]
        
        var methodArguments = [
            "method": METHOD_NAME,
            "api_key": API_KEY,
            "text": word,
            "safe_search": SAFE_SEARCH,
            "extras": EXTRAS,
            "format": DATA_FORMAT,
            "nojsoncallback": NO_JSON_CALLBACK,
            "sort": SORT
        ]
        
        if methodArguments.isEmpty {
            
        }else {
            self.getImageFromFlickrSearch(methodArguments)
        }
    }

}

