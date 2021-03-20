From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:01:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/cracklib: add
 CRACKLIB_CPE_ID_VENDOR
In-Reply-To: <20210320182102.444974-1-fontaine.fabrice@gmail.com>
References: <20210320182102.444974-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320210128.72f86b07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 19:21:02 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:cracklib_project:cracklib is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Acracklib_project%3Acracklib
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cracklib/cracklib.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
