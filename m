From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 06 Aug 2015 18:31:02 +0200
Subject: [Buildroot] Analysis of build results for 2015-08-05
References: <20150806063016.4A0BB102D1F@stock.ovh.net>
 <20150806113014.163c6592@free-electrons.com>
Message-ID: <XnsA4EEBC5DFAFBFberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20150806113014.163c6592 at free-electrons.com: 

> Hello all,

>>         i686 |                  mesa3d-10.6.3 | NOK |
>>         http://autobuild.buildroot.net/results/08305f397ef523ee864827e1e
>>         267475a9f6f397f/ 
> checking for LIBUDEV... no
> configure: error: gbm requires --enable-dri
> make: ***
> [/home/test/autobuild/instance-1/output/build/mesa3d-10.6.3/.stamp_config
> ured] Error 1 make: Leaving directory
> `/home/test/autobuild/instance-1/buildroot' Bernd, is this fixed by one
> of the pending patches on mesa3d ? 

Hi Thomas,

yes, this patch fixes the build error:
http://patchwork.ozlabs.org/patch/502988/

Regards, Bernd
