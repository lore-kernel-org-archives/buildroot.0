From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 12:08:52 +0200
Subject: [Buildroot] [PATCH] package/cryptopp: Backport gcc
 compatibility patch
In-Reply-To: <1461310085-19374-1-git-send-email-julian@jusst.de>
References: <1461310085-19374-1-git-send-email-julian@jusst.de>
Message-ID: <20160422120852.42c193a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Apr 2016 09:28:05 +0200, Julian Scheel wrote:
> Import patch from cryptopp upstream which fixes the gcc version checks for
> using attribute deprecated with messages. Fixes build with host gcc versions <
> 4.5.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
>  ...ixed-GCC-version-for-deprecated-attribute.patch | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch
> 
> diff --git a/package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch b/package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch
> new file mode 100644
> index 0000000..d46ae76
> --- /dev/null
> +++ b/package/cryptopp/0001-Fixed-GCC-version-for-deprecated-attribute.patch
> @@ -0,0 +1,66 @@
> +From f707b9ef1688d4429ca6239cf2dc236440974681 Mon Sep 17 00:00:00 2001
> +From: Jeffrey Walton <noloader@gmail.com>
> +Date: Sun, 27 Dec 2015 23:44:36 -0500
> +Subject: [PATCH] Fixed GCC version for deprecated attribute
> +

Please add a reference/link to the upstream commit being backported,
and after that, your Signed-off-by.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
