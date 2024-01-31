//
//  NewsViewModel.swift
//  HaberProjesi
//
//  Created by Şevket Uğurel on 31.01.2024.
//

import Foundation

struct NewsTableViewModel{
    let NewsList : [News]
    
    
    
}

extension NewsTableViewModel{
    func numberOfRowInSection() -> Int{
        return self.NewsList.count
    }
    
    func newsAtIndexPath(_ index:Int) -> NewsViewModel{
        let news = self.NewsList[index]
        return NewsViewModel(news: news)
     }
}

struct NewsViewModel{
    let news:News
    
    var title : String{
        return self.news.title
    }
    
    var story : String{
        return self.news.story
    }
}

