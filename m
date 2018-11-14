From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 14 Nov 2018 08:03:22 +0200
Subject: [Buildroot] [PATCH] boot/syslinux: Fix build with glibc 2.23+
In-Reply-To: <20181114000205.9110-1-alexander.sverdlin@gmail.com>
References: <20181114000205.9110-1-alexander.sverdlin@gmail.com>
Message-ID: <20181114060320.2fjxyowtvomgivtl@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,

On Wed, Nov 14, 2018 at 01:02:05AM +0100, Alexander Sverdlin wrote:
> When building with glibc 2.23+, the "major", "minor" and "makedev"

Should be "glibc 2.28+". Ditto for the subject line.

> functions are defined in "sys/sysmacros.h". The patch
> "extlinux: pull in sys/sysmacros.h for major/minor/makedev",
> applied to Syslinux during 2016Apr, should help. Please note that not
> only Syslinux is affected by this change in glibc.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> Link: https://www.syslinux.org/wiki/index.php?title=Building

This line should be above the sign-off as part of the commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
