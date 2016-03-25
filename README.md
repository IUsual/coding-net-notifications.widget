# Coding.net Notifications Widget
Ubersicht widget that pull down Coding.net notifications and display them on desktop.

Now the widget is tiny, useful but rough, join and help if you want!

![coding-net-notifications](https://raw.githubusercontent.com/IUsual/coding-net-notifications.widget/master/screenshot.png)

## Features

1. Pull down notifications of [Coding.net](https://coding.net), and display them in nice outlook on desktop.
2. Customizable  position (top & right) and width.
3. support clickable anchor. Press `Command` and hold on, now if you click a link, you will get a page opened on your default web browser.
4. Automic make notification as read. When a notification item clicked, a post request will be sent automicly to mark the notification you click as read.

## Setup

Just set sid in line 4 of index.coffee like below, and the widget will appear in the upper right cornerer of your desktop.

	sid = "4730dc04-3372fe884-4acb-..."


## Todo

1. ~~Support clickable anchor.~~
2. The outlook of now widget references the style of [git-log](https://github.com/DigitallyBorn/Ubersicht-Git-Log) widget. I think git-log looks well, and, I copy down a part of style when I made this widget. Anyway, I'm trying to get a new outward appearance that is unique.

## About sid

Your sid has been storaged in **local file only**, and communicated via **HTTPS**. So it is safe enough that you needn't worry about.