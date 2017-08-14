From: daggs <daggs@gmx.com>
Date: Mon, 14 Aug 2017 20:09:27 +0200
Subject: [Buildroot] autodetection upon usb insertion.
Message-ID: <trinity-82be2f69-e0ba-492b-9616-3deb9c70a625-1502734167646@3c-app-mailcom-bs12>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I have a sysvinit based image with eudev which as a usb dongle connected to it.
when I boot the system with the dongle connected, upon login, all them modules are loaded and the device is ready to use.
but when I connected it when the system is already running, I get nothing. not detection even if I load all the drivers manually, it is still not detected.
what am I missing?

Thanks,

Dagg.
