From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 14:14:01 +0100
Subject: [Buildroot] [PATCH 08/12] package/x11r7/xdriver_xf86-video-ati:
 bump version to 7.6.1
In-Reply-To: <1450522892-14611-8-git-send-email-bernd.kuhls@t-online.de>
References: <1450522892-14611-1-git-send-email-bernd.kuhls@t-online.de>
 <1450522892-14611-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151219141401.69511d6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 19 Dec 2015 12:01:28 +0100, Bernd Kuhls wrote:

> +# xdriver_xf86-video-ati requires O_CLOEXEC
> +XDRIVER_XF86_VIDEO_ATI_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"

Can you report this problem upstream so that they fix their code to
define _GNU_SOURCE when needed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
