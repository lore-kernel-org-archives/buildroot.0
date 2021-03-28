From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:56:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnpp: bump to version 0.21.0
In-Reply-To: <20210323083006.90238-1-joerg.krause@embedded.rocks>
References: <20210323083006.90238-1-joerg.krause@embedded.rocks>
Message-ID: <20210328225600.31351b0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Mar 2021 09:30:06 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> From https://www.lesbonscomptes.com/upmpdcli/pages/releases.html:
> 
> 2021-03-13 libupnpp 0.21.0
>  * Allow configuring the subscription timeout (init option)
>  * Add interface for the lib to report a subscription autorenewal failure, and
>    to renew all subscriptions.
>  * Add API to set the product/version values in User-Agent and Server headers.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnpp/libupnpp.hash | 4 ++--
>  package/libupnpp/libupnpp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
