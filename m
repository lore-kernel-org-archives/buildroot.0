From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 24 Sep 2015 21:26:28 +0200
Subject: [Buildroot] [PACH v2 00/38] efl bump to 1.15.1
In-Reply-To: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
References: <1441747212-27421-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <56044E64.5090108@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 08/09/2015 23:19, Romain Naour a ?crit :
> This series bump the efl package to the latest release and also update all
> other packages which use efl.
> 
> The elf related packages are no longer in package/efl directory to
> follow the Buildroot recommendations.
> 
> This series has been tested under Qemu for x86 using the kernel based on
> linux config povided in board/qemu/x86. I've enabled CONFIG_FB_CIRRUS
> and some other video related options during testing.
> An example defconfig can be added in a followup patch.
> 
> It also been tested on ARM with a uClibc-ng 1.0.5 + a patch
> which has been merged in uClibc-ng 1.0.6 release.
> Legacy uClibc toolchains are not supported due to missing mkstemps().
> 
> /!\ Warning for autobuilders /!\
> All uClibc-ng toolchains must be rebuilt with the latest release.
> 
> The sdl2 support has been removed from this series since sdl2 package
> is not merged upstream yet.
> 
> Patches  1 to  3 add some new packages used by efl
> Patches  4 to  8 move existing efl packages outside or package/efl directory.
>                  There is no efl package at this point.
> Patches  9 to 21 add a new efl package updated to 1.14.2.
> Patches 22 to 27 update all other packages which use efl.
> Patches 28 to 37 remove old efl packages.
> Patch 38 add a new package libemotion-generic-players
> 
> This is a first part, other packages which use efl are ready and will be
> sent in a followup series:
> 
> * rage
> * terminology
> * empc
> * ecrire
> * python-efl
> * econnman
> * libetrophy
> * elemines
> * libcanberra
> * e-cho
> 
> Thanks to Vicente Bergas for testing on musl!
> 
> Since v1:
> * EFL bump to 1.15.1 instead of 1.14.2
> * libelementary bump to 1.15.1 instead of 1.14.2
> * enlightenment bump to 0.19.9 instead of 0.19.7
> 

I'll wait for efl 1.15.2 release [1] before sending another series.
It will also contain enlightenment 0.19.11 release.

[1] http://sourceforge.net/p/enlightenment/mailman/message/34477142/

Best regards,
Romain
