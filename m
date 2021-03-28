From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:56:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnpupnp: bump to version 4.1.1
In-Reply-To: <20210323083103.184990-1-joerg.krause@embedded.rocks>
References: <20210323083103.184990-1-joerg.krause@embedded.rocks>
Message-ID: <20210328225604.08947f84@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 23 Mar 2021 09:31:04 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> From https://www.lesbonscomptes.com/upmpdcli/pages/releases.html:
> 
> 2021-03-13 libnpupnp 4.1.1
>  * Fix HEAD requests. Samsung TVs now work with Gerbera + libnpupnp
> 
> 2021-03-13 libnpupnp 4.1.0
>  * Send SERVER and USER-AGENT headers in misc places where mandated or useful.
>  * Add API for the client code to set the user-agent and server string values
>  * Fix building and running with --disable-ipv6
>  * Misc portability fixes.
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
