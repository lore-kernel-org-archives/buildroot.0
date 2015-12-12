From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Dec 2015 14:46:12 +0100
Subject: [Buildroot] [PATCH v9 03/32] package/libevas-generic-loaders:
 add missing MMU dependency
In-Reply-To: <1449927215-3452-4-git-send-email-romain.naour@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-4-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151212144612.2a50097f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 12 Dec 2015 14:33:06 +0100, Romain Naour wrote:
> The MMU dependency from glib2 via librsvg was not propagated
> to the SVG loader.
> 
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v8: Add a commit log and fix the commit title (Yann)
> v6: new patch
> ---
>  package/libevas-generic-loaders/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
