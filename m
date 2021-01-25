From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 21:48:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/xinetd: add XINETD_CPE_ID_VENDOR
In-Reply-To: <20210124181306.1031250-1-fontaine.fabrice@gmail.com>
References: <20210124181306.1031250-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125214857.32218fd2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 24 Jan 2021 19:13:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> cpe:2.3:a:xinetd:xinetd is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Axinetd%3Axinetd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xinetd/xinetd.hash | 2 +-
>  package/xinetd/xinetd.mk   | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
