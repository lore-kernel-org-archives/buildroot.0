From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:22:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: support additional cpu
 families
In-Reply-To: <20200915152205.1249707-1-james.hilliard1@gmail.com>
References: <20200915152205.1249707-1-james.hilliard1@gmail.com>
Message-ID: <20200919152254.480b5e18@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 09:22:05 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Meson expects known cpu families to be in a normalized format based on
> https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> Add support for m68k, microblaze and sh4 cpu families.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/meson/meson.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
