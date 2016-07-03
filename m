From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 18:08:53 +0200
Subject: [Buildroot] [PATCH 4/4] package/libbluray: add support for
 libbdplus
In-Reply-To: <1467487508-30061-4-git-send-email-bernd.kuhls@t-online.de>
References: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
 <1467487508-30061-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160703180853.378aeac0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 21:25:08 +0200, Bernd Kuhls wrote:

> +# libbdplus is a run-time dependency loaded by dlopen
> +ifeq ($(BR2_PACKAGE_LIBBDPLUS),y)
> +LIBBLURAY_DEPENDENCIES += libbdplus
> +endif

For the same reason as PATCH 2/4, I marked this patch as Rejected in
patchwork. Let me know if you disagree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
