From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 24 May 2016 23:01:58 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-23
References: <20160524063023.4C8B610173F@stock.ovh.net>
 <20160524224834.4fb29814@free-electrons.com>
Message-ID: <XnsA612EA4CE6775berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20160524224834.4fb29814 at free-electrons.com:

>>          arm |                      vlc-2.2.3 | NOK | 
http://autobuild.buildroot.net/results/967f032a509c4e3cf059a1ac5ceb53269fd841
9f/
> 
>   CCLD     libgl_plugin.la
> /home/peko/autobuild/instance-0/output/host/opt/ext-
toolchain/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/4.9.3/../../../../x86_
64-buildroot-linux-uclibc/bin/ld: cannot find -lGL
> collect2: error: ld returned 1 exit status
> 
> Bernd, Gustavo, do we have patches for this one?

Hi Thomas,

yes, the problem is caused by mesa3d: 
http://patchwork.ozlabs.org/patch/623236/

Regards, Bernd
