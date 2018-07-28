From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Jul 2018 00:23:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/libva: bump version to 2.2.0
References: <20180714105513.16687-1-bernd.kuhls@t-online.de>
 <20180714221102.3f88c992@windsurf>
Message-ID: <s07v2fxkc3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 14 Jul 2018 22:11:02 +0200 schrieb Thomas Petazzoni:

> Please fix this properly, by adding an autoconf check testing if
> -fstack-protector is available and/or making sure CFLAGS passed in the
> environment are properly taken into account.

Hi Thomas,

done (hopefully): https://github.com/intel/libva/pull/226
Now I will wait for their review and continue with the remaining va 
packages afterwards.

Regards, Bernd
