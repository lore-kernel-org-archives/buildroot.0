From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 May 2016 19:26:26 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
 <20160507225043.56bdc54f@free-electrons.com> <57347FBA.7070605@beneth.fr>
Message-ID: <2vqe0dx72u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 12 May 2016 15:06:02 +0200 schrieb Beno?t Mauduit:

> Ps: I just see that archlinux is providing a patch[2] for building kodi
> with gcc 6. Are we interested ? or are we waiting the next kodi ?
> 
> [1] : https://archlinuxarm.org/packages/armv6h/kodi-rbp/files/PKGBUILD
> [2] :
> https://archlinuxarm.org/packages/armv6h/kodi-rbp/files/gcc6_fix.patch

Hi Beno?t,

I created that patch and send it to already here:
http://patchwork.ozlabs.org/patch/616330/

Please review the patch to help its integration in buildroot. Upstream 
(https://github.com/xbmc/xbmc/pull/9703) had no technical complaints 
about the patch but will not commit it because they won't do another 
release for the Jarvis-16 branch. The next version Krypton-17 will not 
need the patch.

You can also test my kodi17 branch for buildroot:
https://github.com/bkuhls/buildroot/tree/kodi17

Regards, Bernd
