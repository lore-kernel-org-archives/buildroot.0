From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Dec 2019 23:45:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/spidermonkey: depends on host
 gcc >= 4.9
In-Reply-To: <20191204214913.718567-1-aduskett@gmail.com>
References: <20191204214913.718567-1-aduskett@gmail.com>
Message-ID: <20191206234551.0f5e28a2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Dec 2019 13:49:13 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> If GCC on the host is older than 4.9, during the configure stage an
> error is thrown such as:
> 
> checking whether the host C compiler can be used... no
> ERROR: Only GCC 4.9 or newer is supported (found version 4.8.2).
> 
> Depend on the host gcc version being >= 4.9
> 
> Fixes:
> http://autobuild.buildroot.net/results/192661452fd522bf46b23d5a7a522eb853a984bf
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>
> ---
>  package/spidermonkey/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
