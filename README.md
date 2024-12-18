# Гра Space Invaders

# Стек технологій

- Swift
- SwiftUI
- SpriteKit

# Опис 

Кожний екран є окремим View, а логіка гри інкапсульована у директорії GameScene, де знаходяться класи для різних обʼєктів та логіка самої гри

Коли користувач відкриває гру, він потрапляє на головне меню, де бачить кнопку для початку гри, для перегляду своїх нагород та налаштувань гри

![Знімок екрана 2024-12-12 о 01 45 07](https://github.com/user-attachments/assets/9d1ec18c-a596-4feb-98a7-7f4111f09d00)

## Логіка гри

Натискаючи кнопку "Play", починається геймплей. Потрібно рухати космічний корабель, щоб він не натрапив на астероїд. За кожний астероїд, який не потрапив у корабель, гравець отримує 1 бал

 ![Знімок екрана 2024-12-12 о 01 45 17](https://github.com/user-attachments/assets/c640a0e5-61c3-4b3d-a624-212fa21eeb16)

Якщо корабель стикається із астероїдом, то гра закінчується і гравець бачить свій результат. Розпочати заново можна простим натисканням на будь яке місце на екрані

![Знімок екрана 2024-12-12 о 01 45 23](https://github.com/user-attachments/assets/7e9de071-befb-4dbe-919e-c6b821dce332)

## Нагороди

Нагороди визначаются за рекордом, який набив гравець – за кожне побиття рекорду на 20 балів дається одна нагорода.
Отримані нагороди підсвічуються

![Знімок екрана 2024-12-12 о 01 46 20](https://github.com/user-attachments/assets/a454fc5a-11a6-4eed-b8e5-0f61aec99a48)

## Налаштування

У грі грає музика та при зіткненні телефон буде вібрувати. За бажання, це можна вимкнути у налаштуваннях

![Знімок екрана 2024-12-12 о 01 46 29](https://github.com/user-attachments/assets/346917cc-afc5-4eaf-82e8-022b604e0e87)

# Як запустити

1. Мати встановлений XCode
2. Склонувати репозиторій: ```git clone https://github.com/kreslavskiy/SpaceInvaders.git```
3. В XCode відкрити файл ```SpaceInvaders.xcodeproj```
4. Обрати будь який симулятор із мінімальною версією IOS 16.0 та запустити проєкт
