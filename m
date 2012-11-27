From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Nov 2012 16:30:37 +0100
Subject: [Buildroot] Qt mouse, keyboard, touchscreen
In-Reply-To: <1354002375.96935.YahooMailNeo@web164604.mail.gq1.yahoo.com>
References: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
 <50B09888.9000907@relinux.de>
 <1353916198.97471.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <50B3210E.2010806@relinux.de>
 <1353917395.39625.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <50B32588.7010800@relinux.de>
 <1354002375.96935.YahooMailNeo@web164604.mail.gq1.yahoo.com>
Message-ID: <20121127163037.3f619184@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Zoran Djordjevic,

On Mon, 26 Nov 2012 23:46:15 -0800 (PST), Zoran Djordjevic wrote:

> My /dev/input node has event0, event1, mouse0 and mice.
> When I give: export QWS_MOUSE_PROTO=tslib:/dev/input/event0, 
> touch screen works fine. However, tried different options for
> USB?mouse, and neither one works (cat /dev/input/mouse0 or mice gives
> terminal "garbage"). Regarding keyboard, I gave: export
> QWS_KEYBOARD=linuxinput:/dev/input/event1 Keyboard (USB)?does work,
> but from that moment my terminal connected keyboard (via COM port) -
> doesn't work (Ctrl-C). When exiting application, I can't give
> commands via terminal. Any help ? 

Apply the attached patch to Qt.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt-4.7.3-remove-ioctl.patch
Type: text/x-patch
Size: 721 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121127/37192ff9/attachment.bin>
