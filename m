From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:10:28 +0200
Subject: [Buildroot] [PATCH 1/3] qemu-microblazeel: update to latest
 kernel
In-Reply-To: <20140921193506.GA7473@waldemar-brodkorb.de>
References: <20140921193506.GA7473@waldemar-brodkorb.de>
Message-ID: <20140921221028.136d6cab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Sun, 21 Sep 2014 21:35:06 +0200, Waldemar Brodkorb wrote:
> Update config to Linux 3.16.3.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/microblazeel-mmu/linux-3.14.config |   59 -------------------------
>  board/qemu/microblazeel-mmu/linux-3.16.config |   59 +++++++++++++++++++++++++
>  board/qemu/microblazeel-mmu/readme.txt        |    2 +-
>  configs/qemu_microblazeel_mmu_defconfig       |   10 ++---
>  4 files changed, 65 insertions(+), 65 deletions(-)
>  delete mode 100644 board/qemu/microblazeel-mmu/linux-3.14.config
>  create mode 100644 board/qemu/microblazeel-mmu/linux-3.16.config

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
