From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:59:13 +0100
Subject: [Buildroot] [PATCH] package/luv: bump to version 1.32.0-0
In-Reply-To: <20191104142002.7618-1-joerg.krause@embedded.rocks>
References: <20191104142002.7618-1-joerg.krause@embedded.rocks>
Message-ID: <20191104215913.7902bd80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Nov 2019 15:20:02 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Drop hook to add pc-file. Correct installation of the pc-file is
> included in the new version.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/luv/libluv.pc.in | 12 ------------
>  package/luv/luv.hash     |  2 +-
>  package/luv/luv.mk       |  8 +-------
>  3 files changed, 2 insertions(+), 20 deletions(-)
>  delete mode 100644 package/luv/libluv.pc.in

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
