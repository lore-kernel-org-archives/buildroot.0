From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Aug 2014 19:55:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/procps-ng: fix linking with intl
In-Reply-To: <1408629367-7336-2-git-send-email-romain.naour@openwide.fr>
References: <1408629367-7336-1-git-send-email-romain.naour@openwide.fr>
 <1408629367-7336-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140825195544.7ae8ced8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 21 Aug 2014 15:56:07 +0200, Romain Naour wrote:
> procps-ng doesn't build with (e)glibc toolchain when gettext package is
> selected.
> 
> With (e)glibc libintl is provided by the libc whereas with uClibc it's provided
> by gettext.
> 
> Linking with intl is only needed if the toolchain needs gettext and locale is
> set.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3e8/3e8464e0b00ce22fa02a6337159fca250d86425c/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/procps-ng/procps-ng.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
