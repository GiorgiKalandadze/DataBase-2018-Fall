﻿1. დაწერეთ სელექთი რომელიც წამოიღებს სახელს, გვარს, თანამდებობას და ხელფასს, ყველა ისეთი თანამშრომლებისთვის, 
რომლებიც გამოიმუშავებენ HR დეპარტამენტის ყველაზე მაღალანაზღაურებად თანამშრომელზე მეტს.ასევე გამოიტანეთ დეპარტამენტის სახელი, და ქალაქი რომელშიც მდებარეობს დეპარტამენტი.
(1 ქულა)

2. გამოიტანეთ ისეთი დეპარტამენტების თანამშრომლების სახელი, გვარი, პოზიცია დეპარტამენტის ნომერი და დეპარტამენტის სახელი, 
რომლებშიც დეპარტამენტის ჭრილში აღებული საშუალო ხელფასი უფრო მაღალია ვიდრე კომპანიის ჭრილში აღებული საშუალო ხელფასი.
თუ ხელფასი ნაკლებია 5000-ზე გამოიტანეთ low_sal, თუ 5000-დან 10,000-მდეა გამოიტანეთ middle_sal, თუ ხელფასი მეტია ან ტოლი 10,000-ზე მაშინ high_sal.
დაალაგეთ დეპარტამენტების ნომრების მიხედვით ისე რომ ჯერ ჩანდეს მე-80 დეპარტამენტი (ასეთის არსებობის შემთხვევაში) ბოლოს ჩანდეს მე-100 დეპარტამენტი (ასეთის არსებობის შემთხვევაში),
ხოლო ყველა სხვა დეპარტამენტი მოექცეს ამ ორს შორის და იყოს დასორტირებული ზრდადობით.
(2.5 ქულა)

3. დაწერეთ სელექთი, რომელიც წამოიღებს ყველა ისეთი თანამშრომელის სახელს, გვარს და დეპარტამენტის ნომერს, რომლის ხელფასიც არის ოთხნიშნა და ხელფასში ურევია ციფრი 5.
ასევე ამ თანამშრომლებისთვის დათვალეთ რამდენი ადამიანი მუშაობს მათ დეპარტამენტში, მაქსიმალური ხელფასი, მინიმალური და საშუალო ხელფასები და გამოიტანეთ სელექთში.
თუ ეს თანამშრომელი იღებს საკომისიოს გამოიტანეთ ველი რომელშიც იქნება შემდეგი სახის ინფორმაცია: 

თანამშრომლის სახელი - სფეისი - გვარი - სფეისი - სიტყვა "earns a" - სფეისი - საკომისიოს პროცენტის მნიშვნელობა - სიმბოლო % - სფეისი - სიტყვა "commission"

მაგ.: George Bush Earns a 15% commission

თუ ეს თანამშრომელი არ იღებს საკომისიოს გამოიტანეთ "--"

(2 ქულა)

4. დაასელექტეთ ყველა თანამშრომელი, რომლებიც აკმაყოფილებენ შემდეგ პირობებს:
    1. კომპანიაში დასაქმებული არიან უკვე 10 წელზე მეტია.
    2. წარსულში იმავე დეპარტამენტის სხვა პოზიციაზე არ აქვთ ნამუშევარი.
    3. მათი ხელფასი არ სცდება მათსავე პოზიციაზე ხელფასის დაშვებულ მაქსიმალურ და მინიმალური ოდენობას (jobs.min_salary; jobs.max_salary)
    ასეთი თანამშრომლებისათვის დაბეჭდეთ: 
    1.სახელი და გვარი, ისე რომ პირველი სიმბოლოები იყოს დიდი ასოებით წარმოდგენილი და სახელსა და გვარს შორის იყოს 1 "სფეისი"; 
    2. email მხოლოდ პირველ "@"-მდე და დაარქვით user_name;
    3. საკომისიოს ველი წარმოადგინეთ პროცენტის სახით(მაგ: 0.9% ; შეგახსნებეთ, რომ commission_pct-ში წარმოდგენილი არა პროცენტები არამედ წილები), თუ საკომისიო ან უცნობია ან არის 0 დაბეჭდეთ 'without commission';
    
(2.5 ქულა)

5. თანამშრომლის მენეჯერის მენეჯერს ვუწოდოთ "გრანდმენეჯერი";
დაასელექთეთ ყველა თანამშრომელი, რომელთა გრანდმენეჯერების last_name-ებია  'King' ან 'Hunold'. გარდა ამისა ამოიტანეთ თანამშრომლები, რომელთა გრანდმენეჯერის ხელფასი აღემატება 8000-ს და ამასთანავე ეს გრანდმენეჯერი არ არის დეპარტამენტ 'Administration'-ის თანამშრომელი.
ყველა ასეთი თანამშრომლისთვის დაბეჭდეთ: სახელი; გვარი; გრანდმენეჯერის გვარი; გრანდმენეჯერის დეპარტამენტის დასახელება;

(2 ქულა)