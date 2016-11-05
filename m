From: Jan Viktorin <viktorin@rehivetech.com>
Date: Sat, 5 Nov 2016 23:23:03 +0100
Subject: [Buildroot] olimex_a20_olinuxino_lime2_defconfig fails to build
In-Reply-To: <20161105150007.4a4f8622@free-electrons.com>
References: <20161105150007.4a4f8622@free-electrons.com>
Message-ID: <20161105232303.5f86b7af@jvn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 5 Nov 2016 15:00:07 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello Jan,
> 
> Last year, you contributed the olimex_a20_olinuxino_lime2_defconfig to
> Buildroot. Unfortunately, this defconfig now fails to build, due to a
> U-Boot version that is too old to build with gcc 5.x.
> 
> Since it's using a mainline version of U-Boot, could you have a look at
> bumping the U-Boot version to fix this problem, if you still have
> access to this HW ?

Yes I have. I will try to check it.

Regards
Jan

> 
> See
> http://free-electrons.com/~thomas/pub/buildroot-defconfigs/olimex_a20_olinuxino_lime2_defconfig.log.FAIL
> for the full build log.
> 
> Thanks!
> 
> Thomas



-- 
  Jan Viktorin                E-mail: Viktorin at RehiveTech.com
  System Architect            Web:    www.RehiveTech.com
  RehiveTech
  Brno, Czech Republic
