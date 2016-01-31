From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jan 2016 20:46:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/sredird: fix musl build
In-Reply-To: <1454263304-17588-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454263304-17588-1-git-send-email-bernd.kuhls@t-online.de>
 <1454263304-17588-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131204648.6a4aa9e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 31 Jan 2016 19:01:44 +0100, Bernd Kuhls wrote:

> diff --git a/package/sredird/0001-termio.patch b/package/sredird/0001-termio.patch
> new file mode 100644
> index 0000000..7c7c67f
> --- /dev/null
> +++ b/package/sredird/0001-termio.patch
> @@ -0,0 +1,20 @@
> +Fix musl build
> +

I've applied, but I still believe that this is a very poor patch
description. Rather than saying it fixes musl, it should explain what
the build failure is, how it is fixed, and that consequently it fixes
musl.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
