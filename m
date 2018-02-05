From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 07:07:43 +0100
Subject: [Buildroot] [PATCH] package/bootstrap: fix licence file path
In-Reply-To: <20180204231600.22452-1-romain.naour@gmail.com>
References: <20180204231600.22452-1-romain.naour@gmail.com>
Message-ID: <20180205070743.38d58259@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Feb 2018 00:16:00 +0100, Romain Naour wrote:
> The licence file is in css/ directory.
> 
> Fixes:
> http://autobuild.buildroot.net/results/0d4/0d4b9488d1aa80e8d290e4dfe1937c3879eceea4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>  package/bootstrap/bootstrap.hash | 2 +-
>  package/bootstrap/bootstrap.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
