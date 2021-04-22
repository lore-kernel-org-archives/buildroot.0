From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 22 Apr 2021 21:51:31 +0200
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump version to
 LTS_01_2021_Ref01
In-Reply-To: <20210410093738.5529-1-sergio.prado@e-labworks.com>
References: <20210410093738.5529-1-sergio.prado@e-labworks.com>
Message-ID: <20210422215131.1f4efd52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 10 Apr 2021 06:37:38 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Also remove patch (already in upstream)
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...0001-Fix-redirection-of-errno-header.patch | 32 -------------------
>  package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  2 +-
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk    |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
