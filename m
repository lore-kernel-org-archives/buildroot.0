From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:32:01 +0100
Subject: [Buildroot] [PATCHv2] gitlab-ci: store .config files as
 artefacts for defconfig tests
In-Reply-To: <20181208171342.6266-1-yann.morin.1998@free.fr>
References: <20181208171342.6266-1-yann.morin.1998@free.fr>
Message-ID: <20181209173201.0b87e074@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Dec 2018 18:13:42 +0100, Yann E. MORIN wrote:
> Add Buildroot's own .config file, as well as any package's .config file
> (uclibc, linux, and busybox), for later inspection should a build fails,
> notably due to changes in the kconfig-package infrastructure.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - use correct path for packages' .config files
> ---
>  .gitlab-ci.yml    | 2 ++
>  .gitlab-ci.yml.in | 2 ++
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
