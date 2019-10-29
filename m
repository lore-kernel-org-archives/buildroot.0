From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:22:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: security bump version
 to 4.10.10
In-Reply-To: <20191029165627.32627-1-bernd.kuhls@t-online.de>
References: <20191029165627.32627-1-bernd.kuhls@t-online.de>
Message-ID: <fc397ca2-c00f-6b83-77ed-2a8c8c0ef4af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 17:56, Bernd Kuhls wrote:
> This is a security release in order to address the following defects:
> 
> o CVE-2019-10218: Client code can return filenames containing path
>                   separators.
> o CVE-2019-14833: Samba AD DC check password script does not receive
>                   the full password.
> o CVE-2019-14847: User with "get changes" permission can crash AD DC
>                   LDAP server via dirsync.
> 
> Release notes: https://www.samba.org/samba/history/samba-4.10.10.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index e88fe3d147..02220772f6 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.10.9.tar.asc
> -sha256 366df54dc43ff8cb2d3f94fad2a8e8561a398d94ab64b86761778843b5e61678  samba-4.10.9.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.10.10.tar.asc
> +sha256 700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5  samba-4.10.10.tar.gz
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index dc0210e884..c7910d87c8 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.10.9
> +SAMBA4_VERSION = 4.10.10
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
> 
