From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 23:44:47 +0200
Subject: [Buildroot] [PATCH] package/dnsmasq: security bump to 2.85
In-Reply-To: <20210418072040.14527-1-post@lespocky.de>
References: <20210418072040.14527-1-post@lespocky.de>
Message-ID: <20210419234447.50f323da@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 18 Apr 2021 09:20:40 +0200
Alexander Dahl <post@lespocky.de> wrote:

> CVE-2021-3448 applies.  See announcement for details.
> 
> Link: https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q2/014962.html
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/dnsmasq/dnsmasq.hash | 4 ++--
>  package/dnsmasq/dnsmasq.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
