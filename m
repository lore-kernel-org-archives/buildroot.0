From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Jan 2021 23:35:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: add
 FLATBUFFERS_CPE_ID_VENDOR
In-Reply-To: <20210111223644.1418984-1-fontaine.fabrice@gmail.com>
References: <20210111223644.1418984-1-fontaine.fabrice@gmail.com>
Message-ID: <20210114233501.17d516e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Jan 2021 23:36:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:google:flatbuffers is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agoogle%3Aflatbuffers
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flatbuffers/flatbuffers.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
