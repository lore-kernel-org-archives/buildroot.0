From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:28:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/vdr: add VDR_CPE_ID_VENDOR
In-Reply-To: <20210130135038.2368863-1-fontaine.fabrice@gmail.com>
References: <20210130135038.2368863-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131212844.5e7cfa07@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 14:50:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:tvdr:vdr is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atvdr%3Avdr
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/vdr/vdr.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
