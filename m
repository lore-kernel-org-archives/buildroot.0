From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 21:07:16 +0200
Subject: [Buildroot] [PATCH] package/libuio: select gettext when
 BR2_NEEDS_GETTEXT_IF_LOCALE is set
In-Reply-To: <1470348626-15329-1-git-send-email-romain.naour@gmail.com>
References: <1470348626-15329-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160805210716.07a0e697@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Aug 2016 00:10:26 +0200, Romain Naour wrote:
> gettext is added to libuio dependency when BR2_NEEDS_GETTEXT_IF_LOCALE
> is set without selecting it at Kconfig level.
> 
> Fixes:
> http://autobuild.buildroot.net/results/321/321688e16596086d1dad6f489d35edbb7fe7a955
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/libuio/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
