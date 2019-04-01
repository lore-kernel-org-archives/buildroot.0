From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 21:52:53 +0200
Subject: [Buildroot] [PATCH] package/gettext-tiny: host and target
 legal-info are different
In-Reply-To: <20190331214035.14080-1-yann.morin.1998@free.fr>
References: <20190331214035.14080-1-yann.morin.1998@free.fr>
Message-ID: <20190401215253.7eb77a6a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 23:40:35 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> For the target, we only ever use the gettext-tiny dorce, while for the
> host we also use that of gettext-gnu.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/572/5724b246cf411d95702fcff6dbf2b809b899108c/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vadim Kochan <vadim4j@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gettext-tiny/gettext-tiny.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
