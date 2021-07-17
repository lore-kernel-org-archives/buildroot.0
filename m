From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:02:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: add
 LINUXPTP_CPE_ID_VENDOR
In-Reply-To: <20210716214444.344130-1-fontaine.fabrice@gmail.com>
References: <20210716214444.344130-1-fontaine.fabrice@gmail.com>
Message-ID: <20210717100223.7ad102ca@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 16 Jul 2021 23:44:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:linuxptp_project:linuxptp is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxptp_project%3Alinuxptp
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linuxptp/linuxptp.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
