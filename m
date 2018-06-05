From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:46:49 +0200
Subject: [Buildroot] [PATCH] Defconfig arcturus_ucls1012a_defconfig:
 bump UBOOT_CUSTOM_REPO_VERSION
In-Reply-To: <20180605140250.5943-1-oleks@arcturusnetworks.com>
References: <20180605140250.5943-1-oleks@arcturusnetworks.com>
Message-ID: <20180605184649.4f76d917@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jun 2018 10:02:50 -0400, Oleksandr Zhadan wrote:
> This new u-boot custom repo version should fix the arcturus_ucls1012a_defconfig
> fails to build on master. See the build log at:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/71726827
> 
> Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
> ---
>  configs/arcturus_ucls1012a_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with a slightly reworked commit title and commit log.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
