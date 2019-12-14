From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Sat, 14 Dec 2019 15:34:25 +0200
Subject: [Buildroot] Pine64: setting the console to be over HMDI
Message-ID: <CAJX3zAsBo9Den0HdrWFrADZvFvubnmxWjL1FKu5cKUnaBFrGqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I have the pine64 which I want to make as my media center using
Kodi/Buildroot.
I use systemd as the init system.

I managed to build and flash the board. I see it boots with U-Boot boot
output, but when control is passed to linux there's nothing on the screen
other than a blinking cursor on the corner.

The board is up and running, I can tell that since CTRL+ALT+DEL resets the
board, which is enabled by a systemd service.

Kodi itself is also installed, but its unit is WantedBy: multi-user.target

I have two questions:
1. How do I configure the console to be over HDMI and USB keyboard instead
of serial interface?
2. Why kodi is not started - at least in a visible manner?

Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191214/0fbbfe15/attachment.html>
