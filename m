From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 15:27:44 +0200
Subject: [Buildroot] [PATCH] package/network-manager: drop obsolete
 dependencies
In-Reply-To: <20190906092613.2610613-1-lkundrak@v3.sk>
References: <20190906092613.2610613-1-lkundrak@v3.sk>
Message-ID: <20190907152744.5f6038a3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  6 Sep 2019 11:26:13 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> Remove dependencies on libraries NetworkManager no longer uses.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> ---
>  package/network-manager/Config.in          | 3 ---
>  package/network-manager/network-manager.mk | 4 ++--
>  2 files changed, 2 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
