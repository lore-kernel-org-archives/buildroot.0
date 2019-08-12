From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Aug 2019 06:02:05 +0200
Subject: [Buildroot] [PATCH 00/23] package/harfbuzz: needs gcc >= 4.8
References: <20190803191501.5412-1-bernd.kuhls@t-online.de>
 <20190811231845.12735fec@windsurf.home>
Message-ID: <tu472gxn0a.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 11 Aug 2019 23:18:45 +0200 schrieb Thomas Petazzoni:

> However, it is worth mentioning that we have another, unrelated, issue
> with the harfbuzz bump: it fails to build on m68k (with a gcc 7.x
> toolchain):
> 
>   http://autobuild.buildroot.net/?reason=harfbuzz%
> 
> THe problem can easily be reproduced, but I'm not sure why it is
> specific to m68k. Any clue ?

Hi Thomas,

no idea, opened bug report upstream:
https://github.com/harfbuzz/harfbuzz/issues/1901

Regards, Bernd
