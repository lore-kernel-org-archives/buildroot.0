From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:12:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: fix meson cpu_family
 format
In-Reply-To: <20190225005245.1954-1-james.hilliard1@gmail.com>
References: <20190225005245.1954-1-james.hilliard1@gmail.com>
Message-ID: <20190225221246.4bb322f7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Feb 2019 08:52:45 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> meson requires a custom cpu_family format
> https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/pkg-meson.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
