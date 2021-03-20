From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:01:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/davfs2: add DAVFS2_CPE_ID_VENDOR
In-Reply-To: <20210320183019.445398-1-fontaine.fabrice@gmail.com>
References: <20210320183019.445398-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320210131.76d552e6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Mar 2021 19:30:19 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:werner_baumann:davfs2 is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awerner_baumann%3Adavfs2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/davfs2/davfs2.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
