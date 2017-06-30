From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 00:04:24 +0200
Subject: [Buildroot] [PATCH 1/2] package/gnu-efi: bump version to 3.0.6
In-Reply-To: <1498820316-2715-1-git-send-email-benoit.allard@greenbone.net>
References: <1498820316-2715-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170701000424.3508645f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 12:58:35 +0200, Beno?t Allard wrote:
> Refreshed patch 0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch.
> Dropped patch 0002-Fix-parallel-make-failure-for-archives.patch applied upstream.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> ---
>  ...S-CPPFLAGS-to-be-completed-from-the-envir.patch | 21 +++++---
>  ...02-Fix-parallel-make-failure-for-archives.patch | 57 ----------------------
>  package/gnu-efi/gnu-efi.hash                       |  6 +--
>  package/gnu-efi/gnu-efi.mk                         |  2 +-
>  4 files changed, 18 insertions(+), 68 deletions(-)
>  delete mode 100644 package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
