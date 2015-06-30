From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Jun 2015 19:45:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-06-29
References: <20150630063014.44429100A75@stock.ovh.net>
 <20150630140738.526d72b8@free-electrons.com>
Message-ID: <XnsA4C9C90811402berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20150630140738.526d72b8 at free-electrons.com: 

>>          arm |                      exim-4.85 | NOK |
>>          http://autobuild.buildroot.net/results/52ff76838e504e2fd472dbad
>>          755220952e19e007/ 
> /home/buildroot/build/instance-0/output/host/usr/bin/arm-linux-gcc -o
> exim_dbmbuild 
> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib
> /gcc/arm-buildroot-linux-musleabihf/4.9.2/../../../../arm-buildroot-linux
> -musleabihf/bin/ld: cannot find -lnsl collect2: error: ld returned 1
> exit status make[2]: *** [exim_dbmbuild] Error 1

> Musl does not provide a libnsl stub it seems. Luca, as our exim guy,
> can you have a look?

Hi,

fixed by http://patchwork.ozlabs.org/patch/460495/

Regards, Bernd
