From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 23:16:13 +0200
Subject: [Buildroot] [PATCH 1/1] boot/grub2: bump to verson 2.04
In-Reply-To: <20190918170447.31321-1-fontaine.fabrice@gmail.com>
References: <20190918170447.31321-1-fontaine.fabrice@gmail.com>
Message-ID: <20190921231613.1e7cd9e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Sep 2019 19:04:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...reat-R_X86_64_PLT32-as-R_X86_64_PC32.patch | 74 -------------------
>  boot/grub2/grub2.hash                         |  3 +-
>  boot/grub2/grub2.mk                           |  2 +-
>  3 files changed, 3 insertions(+), 76 deletions(-)
>  delete mode 100644 boot/grub2/0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
