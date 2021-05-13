# Edge Alerts

A Flutter package that shows alert from top or bottom of the screen.

## How to Use

```yaml
# add this line to your dependencies
edge_alerts: ^0.0.1
```

```dart
import 'package:edge_alerts/edge_alerts.dart';
```

```dart
edgeAlert(context, title: 'Title', description: 'Description', gravity: Gravity.top);
```

| property        | description                                    |
| --------------- | ---------------------------------------------- |
| context         | BuildContext (required)                        |
| title           | 'Your title goes here' (nullable)              |
| description     | 'Your description goes here' (nullable)        |
| icon            | IconData (nullable)                            |
| backgroundColor | Color (nullable) (Default theme primary color) |
| duration        | number of seconds in int                       |
| gravity         | enum Gravity { top , bottom }                  |

![EdgeAlert](https://github.com/maxzod/EdgeAlerts/blob/master/screenshots/GIF.gif)

## Inspiration

https://github.com/Tapadoo/Alerter/

## Original package

https://github.com/mohamed6996/EdgeAlert

## License

    MIT License
