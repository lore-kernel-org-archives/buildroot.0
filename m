From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:07:34 +0200
Subject: [Buildroot] [PATCH] support/graph-depends: cut on host-ccache
In-Reply-To: <20191001163458.25296-1-francois.perrad@gadz.org>
References: <20191001163458.25296-1-francois.perrad@gadz.org>
Message-ID: <20191002210734.20768440@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  1 Oct 2019 18:34:58 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> When selected, host-ccache is a dependency of almost all packages.
> As such, it clutters the dependency graph uselessly.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/graph-depends | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
