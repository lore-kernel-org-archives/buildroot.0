From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:36:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltris: fix linking with intl
In-Reply-To: <1408470236-30101-1-git-send-email-romain.naour@openwide.fr>
References: <1408470236-30101-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20140821153629.38300748@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 19 Aug 2014 19:43:56 +0200, Romain Naour wrote:
> ltris doen't build with (e)glibc toolchain since commit 454a41016f2f074b69e2c677f4749c213c653e86
> when gettext package is selected.
> 
> With (e)glibc libintl is provided by the libc whereas with uClibc it's provided by gettext.
> 
> Linking with intl is only needed if the toolchain needs gettext and locale is set.
> 
> Fixes:
> http://autobuild.buildroot.net/results/821/82128cb9f5cd6ae2595a8302462f1b5719dad9f7/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/ltris/ltris.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. However, it would be good if your commit logs were
wrapped to a more reasonable length.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
