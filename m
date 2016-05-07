From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:24:35 +0200
Subject: [Buildroot] [PATCH 07/34] reproducibility/libgcrypt: override
 timestamps
In-Reply-To: <1462002570-14706-7-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-7-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507152435.28a49fb3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:03 +0200, Gilles Chanteperdrix wrote:
> with SOURCE_DATE_EPOCH
> ---
>  package/libgcrypt/0003-honor-source-date-epoch.patch | 15 +++++++++++++++
>  package/libgcrypt/libgcrypt.mk                       |  1 +
>  2 files changed, 16 insertions(+)
>  create mode 100644 package/libgcrypt/0003-honor-source-date-epoch.patch
> 
> diff --git a/package/libgcrypt/0003-honor-source-date-epoch.patch b/package/libgcrypt/0003-honor-source-date-epoch.patch
> new file mode 100644
> index 0000000..0f41c1b
> --- /dev/null
> +++ b/package/libgcrypt/0003-honor-source-date-epoch.patch

All patches need a description + Signed-off-by.

Also, has this been submitted upstream? Is it already used by Debian?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
