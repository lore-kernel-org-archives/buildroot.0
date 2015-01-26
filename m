From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 23:19:33 +0100
Subject: [Buildroot] [PATCH 1/4] package/gnu-efi: bump version to 3.0.1
In-Reply-To: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
References: <1421710198-20898-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150126231933.2e31fd52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 20 Jan 2015 00:29:55 +0100, Romain Naour wrote:
> remove upstream patch gnu-efi-03-parallel-make.patch
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  ...S-CPPFLAGS-to-be-completed-from-the-envir.patch | 80 ++++++++++++++++++++++
>  ...02-Fix-parallel-make-failure-for-archives.patch | 57 +++++++++++++++
>  .../gnu-efi/gnu-efi-01-use-override-cflags.patch   | 53 --------------
>  .../gnu-efi-02-parallel-make-archives.patch        | 48 -------------
>  package/gnu-efi/gnu-efi-03-parallel-make.patch     | 22 ------
>  package/gnu-efi/gnu-efi.hash                       |  5 +-
>  package/gnu-efi/gnu-efi.mk                         |  4 +-
>  7 files changed, 142 insertions(+), 127 deletions(-)
>  create mode 100644 package/gnu-efi/0001-Allow-CFLAGS-CPPFLAGS-to-be-completed-from-the-envir.patch
>  create mode 100644 package/gnu-efi/0002-Fix-parallel-make-failure-for-archives.patch
>  delete mode 100644 package/gnu-efi/gnu-efi-01-use-override-cflags.patch
>  delete mode 100644 package/gnu-efi/gnu-efi-02-parallel-make-archives.patch
>  delete mode 100644 package/gnu-efi/gnu-efi-03-parallel-make.patch

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
