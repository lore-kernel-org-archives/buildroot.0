From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:00:08 +0100
Subject: [Buildroot] [PATCH/next 3/3] package/python-daemon: select
 python-lockfile
In-Reply-To: <20191125193850.862709-3-aduskett@gmail.com>
References: <20191125193850.862709-1-aduskett@gmail.com>
 <20191125193850.862709-3-aduskett@gmail.com>
Message-ID: <20191225220008.36b16207@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 11:38:50 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> python-lockfile is needed for runtime. Without it, importing python-daemon
> results in an import error.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  package/python-daemon/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
