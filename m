From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:04:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/postgresql: add
 POSTGRESQL_CPE_ID_VENDOR
In-Reply-To: <20210117120554.315508-1-fontaine.fabrice@gmail.com>
References: <20210117120554.315508-1-fontaine.fabrice@gmail.com>
Message-ID: <20210117150435.0b30f56e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 13:05:54 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:postgresql:postgresql is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apostgresql%3Apostgresql
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/postgresql/postgresql.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
