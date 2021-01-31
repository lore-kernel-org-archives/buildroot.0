From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:25:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/faad2: add CPE variables
In-Reply-To: <20210131125601.3810717-1-fontaine.fabrice@gmail.com>
References: <20210131125601.3810717-1-fontaine.fabrice@gmail.com>
Message-ID: <20210131212543.556cbb3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Jan 2021 13:56:01 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:audiocoding:freeware_advanced_audio_decoder_2 is a valid CPE
> identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaudiocoding%3Afreeware_advanced_audio_decoder_2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/faad2/faad2.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
