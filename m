From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:49:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/ssdp-responder: fix CPE
 variables
In-Reply-To: <20210125175546.1159437-1-fontaine.fabrice@gmail.com>
References: <20210125175546.1159437-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214904.7cc5d366@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Jan 2021 18:55:46 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:simple_service_discovery_protocol_responder_project:simple_service_discovery_protocol_responder
> is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asimple_service_discovery_protocol_responder_project%3Asimple_service_discovery_protocol_responder
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ssdp-responder/ssdp-responder.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
