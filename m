From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:00:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcap-ng: set
 LIBCAP_NG_CPE_ID_VALID
In-Reply-To: <20210115080755.2078014-1-fontaine.fabrice@gmail.com>
References: <20210115080755.2078014-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116220053.55545dea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Jan 2021 09:07:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:libcap-ng_project:libcap-ng is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibcap-ng_project%3Alibcap-ng
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcap-ng/libcap-ng.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
