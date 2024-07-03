//
//  Article.swift
//  Meow
//
//  Created by 李苹果 on 2024/7/3.
//

import Foundation


struct Article:Identifiable{
    var id=UUID()
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
