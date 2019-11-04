From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:48:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: needs NPTL
In-Reply-To: <20191030055850.6069-1-bernd.kuhls@t-online.de>
References: <20191030055850.6069-1-bernd.kuhls@t-online.de>
Message-ID: <20191104214859.63f0fe0c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 06:58:50 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/e18/e1815b96997fb7def688e0aeb5d342fc64dbb64d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/rng-tools/Config.in | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
