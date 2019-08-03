From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Aug 2019 15:53:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/icu: Fix nios2 build
References: <20190803063135.24777-1-bernd.kuhls@t-online.de>
 <20190803084652.1a4a4acf@windsurf.home>
 <3oof1gxvf.ln2@ID-313208.user.individual.net>
 <20190803101655.1fabfa1c@windsurf.home>
Message-ID: <47gg1gxvf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 03 Aug 2019 10:16:55 +0200 schrieb Thomas Petazzoni:

> Thanks for sending the v2, but you did not reply to my question about
> how you figure out what was the correct value for nios2 and xtensa,
> since neither of these architectures are supported by double conversion
> upstream.

sent v3 for nios, tested double-conversion using qemu:
http://patchwork.ozlabs.org/patch/1141493/

Xtensa has no host-qemu support so I can not test it:
http://lists.busybox.net/pipermail/buildroot/2019-August/255940.html

Regards, Bernd
