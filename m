From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:01:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: add DTC_CPE_ID_VENDOR
In-Reply-To: <20210320190006.446819-1-fontaine.fabrice@gmail.com>
References: <20210320190006.446819-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320210143.03f67697@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 20:00:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:dtc_project:dtc is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adtc_project%3Adtc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dtc/dtc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
