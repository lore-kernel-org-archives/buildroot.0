From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Dec 2015 23:39:45 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/lttng-tools: remove no
 longer needed patch
In-Reply-To: <1449616274-10251-1-git-send-email-s.martin49@gmail.com>
References: <1449616274-10251-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151209233945.173024c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed,  9 Dec 2015 00:11:11 +0100, Samuel Martin wrote:
> This patch is already merged since the v2.7.0-rc1 version.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/0178e243eb27376d1507f1adde5d12bdbc0f352b
>   (and many others)
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> changes v1->v2:
> - update commit log with abo ref.
> - update ART tags
> ---
>  ...-and-Config-string-declarations-as-extern.patch | 443 ---------------------
>  1 file changed, 443 deletions(-)
>  delete mode 100644 package/lttng-tools/0001-Fix-Mark-MI-and-Config-string-declarations-as-extern.patch

All four patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
