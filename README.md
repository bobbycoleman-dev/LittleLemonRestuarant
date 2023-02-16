# Little Lemon Restuarant App
## Meta iOS App Development Course Capstone Project

Hello fellow dev learners!

This was fun project to work on and quit tough at some parts. I learned a lot along the way and I hope to continue learning. 

For this project specifically, I found the data part the most difficult. UserDefaults were okay to navigate; I had some hang-ups here and there, but what I really struggled with was the CoreData. I was stuck for quite a while at one point and after a quick Google search, it turns out that after creating an entity, you have to completely close out XCode before it can recognize the new entity. Whether it's a glitch or not, that is something that was not taught in this course.

One area that I also really spent a lot of time on, trying different code after code until it worked was the looping through the data.

```swift
let task = URLSession.shared.dataTask(with: request) {data,_,_ in
            if let data = data {
                let decoder = JSONDecoder()
                let menu = try? decoder.decode(MenuList.self, from: data)
                menu?.menu.forEach { dish in
                    let item = Dish(context: viewContext)
                    item.title = dish.title
                    item.price = dish.price
                    item.image = dish.image
                    item.itemDescription = dish.itemDescription
                    
                    print("\(dish.title)")
                }
                try? viewContext.save()
            }
        }
        task.resume()
```
This really got me for a couple hours until I had a complete "Ah HA!" moment.

![alt text]()
