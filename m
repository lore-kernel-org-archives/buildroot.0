From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 13:58:38 +0200
Subject: [Buildroot] [PATCH 4/4] package/qt5/qt5webkit: needs host gcc
 >= 4.8 for icu support
In-Reply-To: <9b4v0exged.ln2@ID-313208.user.individual.net>
References: <20170610091513.29031-1-bernd.kuhls@t-online.de>
 <20170610091513.29031-2-bernd.kuhls@t-online.de>
 <20170610230843.0ce76b59@windsurf.home>
 <9b4v0exged.ln2@ID-313208.user.individual.net>
Message-ID: <20170611135838.1ef0f3a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 08:25:13 +0200, Bernd Kuhls wrote:

> > it would be nice if you could at least test your Config.in changes by
> > running "make menuconfig" :)  
> 
> Hi,
> 
> I did but I missed the fact that
> 
> source "package/qt5/qt5webkit/Config.in"
> 
> is guarded by 
> 
> if BR2_PACKAGE_QT5

I didn't had qt5 enabled. All Config.in files are parsed when you run
"make menuconfig", even if their inclusion is guarded by a if..endif.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
