From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 23:21:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnpupnp: security bump to
 version 4.1.4
In-Reply-To: <20210422075016.91908-1-joerg.krause@embedded.rocks>
References: <20210422075016.91908-1-joerg.krause@embedded.rocks>
Message-ID: <20210423232106.64bc5875@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Apr 2021 07:50:16 +0000
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Fix vulnerability to DNS-rebind attacks.
> 
> This security fix addresses the same vulnerability isue which was reported
> for libupnp (which libnpupnp is derived from) in CVE-2021-29462.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libnpupnp/libnpupnp.hash | 4 ++--
>  package/libnpupnp/libnpupnp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
