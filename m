From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:01:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: add DHCPCD_CPE_ID_VENDOR
In-Reply-To: <20210320184157.445846-1-fontaine.fabrice@gmail.com>
References: <20210320184157.445846-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320210135.285a70c5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 19:41:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:dhcpcd_project:dhcpcd is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adhcpcd_project%3Adhcpcd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcpcd/dhcpcd.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
