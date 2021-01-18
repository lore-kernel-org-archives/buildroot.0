From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:06:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: add
 SYSLOG_NG_CPE_ID_VENDOR
In-Reply-To: <20210117171312.356255-1-fontaine.fabrice@gmail.com>
References: <20210117171312.356255-1-fontaine.fabrice@gmail.com>
Message-ID: <20210118220606.72d7ff25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 18:13:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:oneidentity:syslog-ng is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aoneidentity%3Asyslog-ng
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
