From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:20:49 +0200
Subject: [Buildroot] [PATCH 1/2] package/network-manager: add CPE
 variables
In-Reply-To: <20210325125442.17709-1-heiko.thiery@gmail.com>
References: <20210325125442.17709-1-heiko.thiery@gmail.com>
Message-ID: <20210328212049.11a2d020@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Mar 2021 13:54:42 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> cpe:2.3:a:gnome:networkmanager is a valid CPE identifier for this
> package:
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Anetworkmanager
> 
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/network-manager/network-manager.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
