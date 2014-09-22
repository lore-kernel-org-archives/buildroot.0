From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:03:29 +0200
Subject: [Buildroot] [PATCH 1/4] qemu-mips: update to latest kernel
In-Reply-To: <20140922151921.GA13349@waldemar-brodkorb.de>
References: <20140922151921.GA13349@waldemar-brodkorb.de>
Message-ID: <20140922190329.250bf349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Mon, 22 Sep 2014 17:19:22 +0200, Waldemar Brodkorb wrote:
> Update to Lnux Kernel 3.16.3.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  board/qemu/mips-malta/linux-3.15.config |   59 -------------------------------
>  board/qemu/mips-malta/linux-3.16.config |   59 +++++++++++++++++++++++++++++++
>  board/qemu/mips-malta/readme.txt        |    2 +-
>  configs/qemu_mips_malta_defconfig       |   10 +++---
>  4 files changed, 65 insertions(+), 65 deletions(-)
>  delete mode 100644 board/qemu/mips-malta/linux-3.15.config
>  create mode 100644 board/qemu/mips-malta/linux-3.16.config

I've applied your four patches updating qemu-mips* configurations.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
