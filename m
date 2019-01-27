From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Jan 2019 21:46:22 +0100
Subject: [Buildroot] [PATCH] package/upmpdcli: fix static build issue
In-Reply-To: <20190124100717.12620-1-joerg.krause@embedded.rocks>
References: <20190124100717.12620-1-joerg.krause@embedded.rocks>
Message-ID: <20190127214622.53141022@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Jan 2019 11:07:17 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> The spotify plugin requires shared library support and needs <dlfcn.h>.
> Explicitly disable the spotify plugin when building upmpdcli in a static
> context.
> 
> Fixes:
> http://autobuild.buildroot.net/results/cb942d3c5f68959d6cbc85535ccff4a275369f91/
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/upmpdcli/upmpdcli.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
