From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:43:02 +0200
Subject: [Buildroot] [PATCH] lvm2: disable build with uClibc-ng
In-Reply-To: <419d2c04c289c8baac8b8d29f3e85a91d07cb6c8.1490851777.git.baruch@tkos.co.il>
References: <419d2c04c289c8baac8b8d29f3e85a91d07cb6c8.1490851777.git.baruch@tkos.co.il>
Message-ID: <20170402234302.4f29f503@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Mar 2017 08:29:37 +0300, Baruch Siach wrote:
> uClibc-ng is missing implementation of floorl() and nearbyintl() from the math
> library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/733/733c4d52f22d5f104b835d0f1c64e8a555ec1339/
> http://autobuild.buildroot.net/results/9ce/9ce371b59f0113d10261ede919a7e4f2ce377b3c/
> http://autobuild.buildroot.net/results/e48/e48fbec55160428b84c8d3b2ca957e8f6432c8e1/
> 
> and more.
> 
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/cryptsetup/Config.in    | 5 +++--
>  package/dmraid/Config.in        | 5 +++--
>  package/docker-engine/Config.in | 1 +
>  package/lvm2/Config.in          | 6 ++++--
>  package/udisks/Config.in        | 6 ++++--
>  5 files changed, 15 insertions(+), 8 deletions(-)

Applied to master after adjusting the commit log as suggested by Yann.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
