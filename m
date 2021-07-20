From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:28:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/ripgrep: add
 RIPGREP_CPE_ID_VENDOR
In-Reply-To: <20210718220700.3297109-1-fontaine.fabrice@gmail.com>
References: <20210718220700.3297109-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720202857.24e7b18c@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 19 Jul 2021 00:07:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:ripgrep_project:ripgrep is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aripgrep_project%3Aripgrep
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ripgrep/ripgrep.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
