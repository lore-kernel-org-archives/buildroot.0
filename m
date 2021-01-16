From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:00:44 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcms2: add CPE variables
In-Reply-To: <20210115075249.2076903-1-fontaine.fabrice@gmail.com>
References: <20210115075249.2076903-1-fontaine.fabrice@gmail.com>
Message-ID: <20210116220044.5c34acaf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Jan 2021 08:52:49 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:littlecms:little_cms is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alittlecms%3Alittle_cms
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lcms2/lcms2.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
