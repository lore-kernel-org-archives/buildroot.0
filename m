From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 16:07:10 +0100
Subject: [Buildroot] [PATCH v3 1/1] tpm-tools: bump to version 1.3.9.1
In-Reply-To: <1513701417-26504-1-git-send-email-yairba@tkos.co.il>
References: <1513701417-26504-1-git-send-email-yairba@tkos.co.il>
Message-ID: <20180107160710.70ce034c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Dec 2017 18:36:57 +0200, Yair Ben Avraham wrote:
> This patch contains the following changes:
>  - Remove all three patches, they are included in upstream version
>  - Add locally calculated sha256 hash
>  - Remove <pkg>_STRIP_COMPONENTS = 2, there is no leading directory
>  - Remove <pkg>_AUTORECONF and <pkg>_GETTEXTIZE since all the patches are
>    being removed.
> 
> Signed-off-by: Yair Ben Avraham <yairba@tkos.co.il>
> ---
>  ..._nvread-include-sys-stat.h-for-open-modes.patch |  33 -------
>  ...-make-sure-libintl-is-in-LDFLAGS-when-nee.patch | 104 ---------------------
>  .../0002-configure.in-remove-Werror.patch          |  27 ------
>  package/tpm-tools/tpm-tools.hash                   |  10 +-
>  package/tpm-tools/tpm-tools.mk                     |   6 +-
>  5 files changed, 8 insertions(+), 172 deletions(-)
>  delete mode 100644 package/tpm-tools/0001-tpm_nvread-include-sys-stat.h-for-open-modes.patch
>  delete mode 100644 package/tpm-tools/0002-Makefile.am-make-sure-libintl-is-in-LDFLAGS-when-nee.patch
>  delete mode 100644 package/tpm-tools/0002-configure.in-remove-Werror.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
