From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 22:00:14 +0100
Subject: [Buildroot] [PATCH 1/2] Revert "package/network-manager: bump
 to version 1.21.2"
In-Reply-To: <20191104130345.3799456-1-lkundrak@v3.sk>
References: <20191104130345.3799456-1-lkundrak@v3.sk>
Message-ID: <20191104220014.0ef6861f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Nov 2019 14:03:44 +0100
Lubomir Rintel <lkundrak@v3.sk> wrote:

> The "1.21.2" is not a NetworkManager release, it's a development
> snapshot. Bring the package back to 1.20.x stable series.
> 
> This reverts commit 9cf61746a28178cff8e700257ecddf950e958ec5.
> It should eventually be brought back, but just not yet.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  package/network-manager/network-manager.hash | 7 +++----
>  package/network-manager/network-manager.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 6 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
