From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Nov 2019 22:22:04 +0100
Subject: [Buildroot] [PATCH] package/libupnp18: bump to version 1.8.6
In-Reply-To: <20191121075210.64613-1-joerg.krause@embedded.rocks>
References: <20191121075210.64613-1-joerg.krause@embedded.rocks>
Message-ID: <20191121222204.79fb966b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 21 Nov 2019 08:52:10 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> This version fixes a runtime issue which crashes gerbera:
> https://github.com/gerbera/gerbera/issues/522
> 
> The issue has been reported upstream:
> https://github.com/mrjimenez/pupnp/pull/122
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnp18/libupnp18.hash | 6 +++---
>  package/libupnp18/libupnp18.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
