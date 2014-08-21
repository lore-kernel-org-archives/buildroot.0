From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:35:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/lbreakout2: fix linking with
 intl
In-Reply-To: <1408533921-22392-1-git-send-email-romain.naour@openwide.fr>
References: <1408533921-22392-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140821153509.5d4602ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 20 Aug 2014 13:25:21 +0200, Romain Naour wrote:
> lbreakout2 doen't build with (e)glibc toolchain when gettext package is selected.
> 
> With (e)glibc libintl is provided by the libc whereas with uClibc it's provided by gettext.
> 
> Linking with intl is only needed if the toolchain needs gettext and locale is set.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a77/a77dd3e18cc4a5e8300ab33eb532cc03d0156f7f/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/lbreakout2/lbreakout2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
