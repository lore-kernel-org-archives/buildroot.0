From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Jun 2017 08:25:13 +0200
Subject: [Buildroot] [PATCH 4/4] package/qt5/qt5webkit: needs host gcc
 >= 4.8 for icu support
References: <20170610091513.29031-1-bernd.kuhls@t-online.de>
 <20170610091513.29031-2-bernd.kuhls@t-online.de>
 <20170610230843.0ce76b59@windsurf.home>
Message-ID: <9b4v0exged.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 10 Jun 2017 23:08:43 +0200 schrieb Thomas Petazzoni:

> it would be nice if you could at least test your Config.in changes by
> running "make menuconfig" :)

Hi,

I did but I missed the fact that

source "package/qt5/qt5webkit/Config.in"

is guarded by 

if BR2_PACKAGE_QT5

Sorry for the hassle.

Regards, Bernd
