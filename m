From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Sep 2014 14:10:59 +0200
Subject: [Buildroot] Analysis of build failures
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
Message-ID: <XnsA3AE9046C17A4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20140912101105.1e932cb8 at free-electrons.com:

>>        arm |                      vlc-2.1.5 | NOK | 
http://autobuild.buildroot.net/results/7102921b0a8d3a09bf7b3f5f18e56dab6ef364
02/
> 
> -L/usr/lib used, bad!
> 
> /home/peko/autobuild/instance-0/output/host/opt/ext-
toolchain/bin/../lib/gcc/arm-none-linux-gnueabi/4.7.3/../../../../arm-none-
linux-gnueabi/bin/ld: warning: library search path "/usr/lib" is unsafe for 
cross-compilation
> /usr/lib/librt.so: file not recognized: File format not recognized
> collect2: error: ld returned 1 exit status
> 
> Bernd, maybe?

Hi,

I cannot reproduce this error here.

Regards, Bernd
