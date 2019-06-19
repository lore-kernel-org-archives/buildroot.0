From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 13:57:53 +0200
Subject: [Buildroot] [PATCH] package/dnsmasq: bump version to 2.80
In-Reply-To: <20190618052415.27541-1-j.w.janssen@lxtreme.nl>
References: <20190618052415.27541-1-j.w.janssen@lxtreme.nl>
Message-ID: <20190619135753.209c1232@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Jun 2019 07:24:15 +0200
Jan Willem Janssen <j.w.janssen@lxtreme.nl> wrote:

> Also automatically enable UBus support when UBus itself is enabled.
> 
> Signed-off-by: Jan Willem Janssen <j.w.janssen@lxtreme.nl>
> ---
>  package/dnsmasq/dnsmasq.hash | 1 +
>  package/dnsmasq/dnsmasq.mk   | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
