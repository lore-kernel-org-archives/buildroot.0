From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:58:21 +0200
Subject: [Buildroot] [PATCH] package/libconfuse: switch to the new
 upstream
In-Reply-To: <1405549965-22539-1-git-send-email-yann.morin.1998@free.fr>
References: <1405549965-22539-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140717095821.505530ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Jul 2014 00:32:45 +0200, Yann E. MORIN wrote:
> From: Alvaro Gamez <alvaro.gamez@hazent.com>
> 
> libconfuse is being migrated to github (see http://www.nongnu.org/confuse/)
> So, just follow suite.
> 
> Needs a bit of a hack so gettextize + autoreconf does not step on each
> other's toes. See comment in the patch.
> 
> Based on a patch by: Alvaro Gamez <alvaro.gamez@hazent.com>
> 
> [me: fix gettextizing, write commit log]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  .../libconfuse-0000-fix-configure-ac.patch         | 27 ++++++++++++++++++++++
>  package/libconfuse/libconfuse.mk                   |  9 +++++---
>  2 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 package/libconfuse/libconfuse-0000-fix-configure-ac.patch

Applied, with Arnout fixes made in the commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
