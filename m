From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Aug 2019 22:42:16 +0200
Subject: [Buildroot] [PATCH] package/package/tpm2-totp: bump to version
 0.1.2
In-Reply-To: <20190809030211.5319-1-unixmania@gmail.com>
References: <20190809030211.5319-1-unixmania@gmail.com>
Message-ID: <20190809224216.18b53084@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  9 Aug 2019 00:02:11 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Drop patches; issues fixed upstream.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  ...tring-warnings-when-building-for-32b.patch | 60 -------------------
>  ...ion-failure-due-to-variable-may-be-u.patch | 42 -------------
>  package/tpm2-totp/tpm2-totp.hash              |  2 +-
>  package/tpm2-totp/tpm2-totp.mk                |  2 +-
>  4 files changed, 2 insertions(+), 104 deletions(-)
>  delete mode 100644 package/tpm2-totp/0001-src-fix-format-string-warnings-when-building-for-32b.patch
>  delete mode 100644 package/tpm2-totp/0002-src-fix-compilation-failure-due-to-variable-may-be-u.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
