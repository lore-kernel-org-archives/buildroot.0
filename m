From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:30:27 +0100
Subject: [Buildroot] [PATCH 5/5] package/unzip: set UNZIP_CPE_ID_VALID
In-Reply-To: <20210117175208.366428-5-fontaine.fabrice@gmail.com>
References: <20210117175208.366428-1-fontaine.fabrice@gmail.com>
 <20210117175208.366428-5-fontaine.fabrice@gmail.com>
Message-ID: <20210118223027.3f7dfca2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Jan 2021 18:52:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:unzip_project:unzip is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aunzip_project%3Aunzip
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/unzip/unzip.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
