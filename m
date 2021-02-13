From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 22:35:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: set
 FETCHMAIL_CPE_ID_VENDOR
In-Reply-To: <20210212214524.168150-1-fontaine.fabrice@gmail.com>
References: <20210212214524.168150-1-fontaine.fabrice@gmail.com>
Message-ID: <20210213223538.1a1f7264@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 12 Feb 2021 22:45:24 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:fetchmail:fetchmail is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afetchmail%3Afetchmail
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fetchmail/fetchmail.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
