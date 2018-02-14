From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:02:48 +0100
Subject: [Buildroot] [PATCH next] iproute2: bump to version 4.15.0
In-Reply-To: <492e49143bb778c17119b57ed55468c20dc6625d.1518529607.git.baruch@tkos.co.il>
References: <492e49143bb778c17119b57ed55468c20dc6625d.1518529607.git.baruch@tkos.co.il>
Message-ID: <20180214220248.60c6aae9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Feb 2018 15:46:47 +0200, Baruch Siach wrote:
> Keep the musl workaround patch for now, even though libc-compat.h has
> been updated from kernel v4.15. To take advantage of the new
> libc-compat.h we need a newer or patched version of musl. The workaround
> patch will be removed once musl is updated, and external autobuilders
> toolchains are rebuilt.
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/iproute2/iproute2.hash | 2 +-
>  package/iproute2/iproute2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
