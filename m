From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:50:23 +0100
Subject: [Buildroot] [PATCH 1/8] package/bitcoin: depends on
 !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
In-Reply-To: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
References: <20191208162725.2561301-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208225023.250dae90@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Dec 2019 17:27:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Obviously, bitcoin depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735, not on
> BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> 
> Fixes:
>  - No autobuilder failure
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bitcoin/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Wow, this is really bad :-/ And it's something that I changed when
applying the original patch, so it's entirely my fault :-/

Thanks for noticing and fixing it. I've applied your entire series.
Thanks a lot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
