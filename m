From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 12:54:29 +0200
Subject: [Buildroot] [PATCH 1/2] parted: bump to version 3.2
In-Reply-To: <20170630124524.5831-1-yegorslists@googlemail.com>
References: <20170630124524.5831-1-yegorslists@googlemail.com>
Message-ID: <20170701125429.680d1350@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 14:45:23 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Remove upstreamed readline related patch.
> 
> Add a patch, that enables parted to be compiled without lvm2.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...rch-linux.c-Compile-without-ENABLE_DEVICE.patch | 79 ++++++++++++++++++++++
>  package/parted/0001-readline-deprecated.patch      | 19 ------
>  package/parted/parted.hash                         |  2 +-
>  package/parted/parted.mk                           |  2 +-
>  4 files changed, 81 insertions(+), 21 deletions(-)
>  create mode 100644 package/parted/0001-libparted-arch-linux.c-Compile-without-ENABLE_DEVICE.patch
>  delete mode 100644 package/parted/0001-readline-deprecated.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
