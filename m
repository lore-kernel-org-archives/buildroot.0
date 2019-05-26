From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 22:57:15 +0200
Subject: [Buildroot] [PATCH V2 7/9] package/glibc: Add C-SKY support
In-Reply-To: <1557305915-11247-7-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-7-git-send-email-guoren@kernel.org>
Message-ID: <20190526225715.5c05bd21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  8 May 2019 16:58:33 +0800
guoren at kernel.org wrote:

> From: Guo Ren <ren_guo@c-sky.com>
> 
> Add glibc build for C-SKY Architecture.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  package/glibc/glibc.hash                | 2 ++
>  package/glibc/glibc.mk                  | 3 +++
>  toolchain/toolchain-buildroot/Config.in | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 5316f03..6e47559 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,2 +1,4 @@
>  # This hash file is not used; instead, update the
>  # hash files in the per-version sub-directories.

Well, did you see this comment ? If you did, why did you add some
hashes to this file ? :-)

> +# Locally calculated (fetched from https://github.com/c-sky/glibc)
> +sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
