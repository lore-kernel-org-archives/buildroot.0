From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 22:08:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.10
In-Reply-To: <20191014165227.116555-1-james.hilliard1@gmail.com>
References: <20191014165227.116555-1-james.hilliard1@gmail.com>
Message-ID: <20191016220820.5d01f765@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 10:52:27 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...roblem-with-undeclared-intptr_t-type.patch | 114 ------------------
>  ...-t-override-ARCH-when-cross-compili.patch} |   0
>  package/gnu-efi/gnu-efi.hash                  |   6 +-
>  package/gnu-efi/gnu-efi.mk                    |   2 +-
>  4 files changed, 4 insertions(+), 118 deletions(-)
>  delete mode 100644 package/gnu-efi/0001-Fix-for-problem-with-undeclared-intptr_t-type.patch
>  rename package/gnu-efi/{0002-Make.defaults-don-t-override-ARCH-when-cross-compili.patch => 0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
