From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 16 May 2016 22:22:11 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <20160516221806.0df441c0@gmx.net>
References: <5738116B.9050904@gmail.com> <20160515100303.003752e2@gmx.net>
 <5738333D.8010707@gmail.com> <20160515140511.5973b7ce@gmx.net>
 <57386743.1030708@gmail.com> <20160516221806.0df441c0@gmx.net>
Message-ID: <573A2BF3.1080701@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 16/05/2016 22:18, Peter Seiderer ha scritto:
>
> Buildroot with Qt5 and Qt5Multimedia using gstreamer1 packages still works
> for me (on RPi 3, buildroot master from git).....

Great!

> Maybe try a complete rebuild? Try to find out why Qt5Multimedia plugin is
> not loaded, maybe a missing library (try strace and/or ldd)?

I will try to ldd files under /usr/lib/qt/plugins/

> Mind to share your buildroot .config file?


Here it is!
Thanks
Marco

-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/xml
Size: 93124 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160516/b5cf2564/attachment-0001.wsdl>
