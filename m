From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 16 May 2016 22:18:06 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <57386743.1030708@gmail.com>
References: <5738116B.9050904@gmail.com> <20160515100303.003752e2@gmx.net>
 <5738333D.8010707@gmail.com> <20160515140511.5973b7ce@gmx.net>
 <57386743.1030708@gmail.com>
Message-ID: <20160516221806.0df441c0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Sun, 15 May 2016 14:10:43 +0200, Marco Trapanese <marcotrapanese@gmail.com> wrote:

> Il 15/05/2016 14:05, Peter Seiderer ha scritto:
> > Would suspect some missing library....maybe I find some time tonight 
> > to do some local test to check/verify your problem... 
> 
> 
> I thank you very much. Please, feel free to ask me any other details or 
> test if they may help you!
> 

Buildroot with Qt5 and Qt5Multimedia using gstreamer1 packages still works
for me (on RPi 3, buildroot master from git).....

Maybe try a complete rebuild? Try to find out why Qt5Multimedia plugin is
not loaded, maybe a missing library (try strace and/or ldd)?

Mind to share your buildroot .config file?

Regards, Peter
