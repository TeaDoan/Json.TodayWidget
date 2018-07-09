//
//  TodayViewController.swift
//  TodayWidget
//
//  Created by Thao Doan on 7/7/18.
//  Copyright © 2018 Thao Doan. All rights reserved.
//

import UIKit
import NotificationCenter
import JokesInfoKit

class TodayViewController: UIViewController, NCWidgetProviding {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        QuotesController.fetchQuote { (quote) in
            OperationQueue.main.addOperation({() ->Void in
                if let quoteData = quote {
                    self.textView.text = quoteData.first?.quote
                }
            })
        }
       
    }
    
    @IBOutlet weak var backGround: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        QuotesController.fetchQuote { (quote) in
            guard let quoteData = quote else {
                completionHandler(NCUpdateResult.noData)
                return
            }
          OperationQueue.main.addOperation {() -> Void in
            self.textView.text = quoteData.first?.quote.capitalized
            
            }
            
        completionHandler(NCUpdateResult.newData)
    }
}


//private var city = "Paris"
//private var country = "France"
//
//var defaults = UserDefaults(suiteName:"group.com.teaDoan.WeatherDemo")
//override func viewDidLoad() {
//    super.viewDidLoad()
//    cityLabel.text = "\(city),\(country)"
//    //Invoke the weather sevice to get the weather data
//    WeatherService.sharedWeatherService().getCurrentWeather(location: city) { (data) in
//        OperationQueue.main.addOperation({ () -> Void in
//            if let weatherData = data {
//                self.weatherLabel.text = weatherData.weather.capitalized
//                self.tempLabel.text = String(format: "%d", weatherData.temperature) + "\u{00B0}"
//            }
//        })
//    }
//}

//override func didReceiveMemoryWarning() {
//    super.didReceiveMemoryWarning()
//    // Dispose of any resources that can be recreated.
//}
//
//func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
//    // Perform any setup necessary in order to update the view.
//
//    // If an error is encountered, use NCUpdateResult.Failed
//    // If there's no update required, use NCUpdateResult.NoData
//    // If there's an update, use NCUpdateResult.NewData
//    if let currentCity = defaults?.value(forKey:"city") as? String,
//        let currentCountry = defaults?.value(forKey:"country") as? String {
//        city = currentCity
//        country = currentCountry
//    }
//    cityLabel.text = "\(city) ,\(country)"
//    WeatherService.sharedWeatherService().getCurrentWeather(location: city) { (data) -> () in
//        guard let weatherData = data else {
//            completionHandler(NCUpdateResult.noData)
//            return
//        }
//        print(weatherData.weather)
//        print(weatherData.temperature)
//
//        OperationQueue.main.addOperation({ () -> Void in
//            self.weatherLabel.text = weatherData.weather.capitalized
//            self.tempLabel.text = String(format: "%d", weatherData.temperature) + "\u{00B0}"
//        })
//
//        completionHandler(NCUpdateResult.newData)
//    }
//
//}
//}
//
}
