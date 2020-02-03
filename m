From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 15:59:02 +0100
Subject: [Buildroot] [PATCH 1/5] package/refpolicy: remove dependency on
 policycoreutils
In-Reply-To: <20200203132951.1331252-1-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
Message-ID: <20200203155902.7c75bdda@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 05:29:47 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Only host-policycoreutils is needed to build refpolicy. Remove the uneeded
> target package.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/refpolicy/Config.in    | 8 --------
>  package/refpolicy/refpolicy.mk | 3 +--
>  2 files changed, 1 insertion(+), 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
