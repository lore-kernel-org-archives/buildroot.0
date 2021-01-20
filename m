From: =?UTF-8?Q?Sebasti=C3=A1n_Conti?= <sebaconti19@gmail.com>
Date: Tue, 19 Jan 2021 23:56:12 -0300
Subject: [Buildroot] Buildroot Touchscreen goes to coordinates 0 0
Message-ID: <CAONQdNmac47XOqi2kec20PbdohXW4jYov-sM3hDvDTsKZZmXTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think is a usb touchscreen that is plug and play and have speakers, but
when I am trying to run a example from qt that you can draw, it draws a
line from coordinates 0 0 to where my finger is.
After installing evtest and building buildroot, the final coordinates of
every touch are 0x 0y.

If I test evest on other linux distro it works perfectly.

Thanks

Init screen: https://i.stack.imgur.com/1NqWY.jpg


Qt example: https://i.stack.imgur.com/xcnq4.jpg


Evtest: https://i.stack.imgur.com/Hqzce.jpg
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210119/c8d68c3c/attachment.html>
