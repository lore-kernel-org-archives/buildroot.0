From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Apr 2019 19:43:22 +0200
Subject: [Buildroot] [PATCH 1/2] package/libva: remove optional mesa3d
 support
References: <20190407171318.19852-1-bernd.kuhls@t-online.de>
 <20190410191307.1681df76@windsurf.home>
Message-ID: <qim1ofxi21.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 10 Apr 2019 19:13:07 +0200 schrieb Thomas Petazzoni:

> I understand the circular dependency issue, but what makes it reasonable
> to drop mesa3d support in libva ? Until now, the choice was rather the
> opposite: have mesa3d support in libva, and no libva support in mesa3d.
> Is there a fundamental reason why one is more useful than the other ?

Hi Thomas,

first I like to mention that I do not have any AMD hardware in use with 
buildroot, I am just following the development of Libreelec:

https://github.com/xbmc/xbmc/pull/13333
https://github.com/LibreELEC/LibreELEC.tv/pull/2403

The motivation for the Kodi patch was: "Hardware decoding with AMD GPUs 
is only supported with this new method"

Because I think this will improve user experience with AMD hardware I 
sent these patches.

Regards, Bernd
