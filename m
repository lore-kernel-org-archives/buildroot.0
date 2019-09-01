From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 01 Sep 2019 22:37:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: broken on or1k
References: <20190831060006.18607-1-bernd.kuhls@t-online.de>
 <87ef11hjws.fsf@dell.be.48ers.dk>
Message-ID: <fpmt3gxijh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 31 Aug 2019 09:29:55 +0200 schrieb Peter Korsgaard:

> This is an old toolchain:
> 
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/
tarballs/br-openrisc-full-2018.02-925-gd4158df.tar.bz2"
> 
> Does this also happen with E.G. the internal toolchain?

Hi Peter,

no, the internal toolchain works, sent v2:
http://patchwork.ozlabs.org/patch/1156348/

Regards, Bernd
