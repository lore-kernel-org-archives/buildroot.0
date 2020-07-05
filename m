From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Jul 2020 15:58:01 +0200
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump version to
 LTS_02_2020_Ref01
In-Reply-To: <20200704004436.21509-1-sergio.prado@e-labworks.com>
References: <20200704004436.21509-1-sergio.prado@e-labworks.com>
Message-ID: <20200705155801.3594732f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  3 Jul 2020 21:44:36 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Also:
> 
> - Add missing hash file.
> - Add new libraries to the install target.
> - Apply patch to fix build with musl (MR sent upstream in [1]).
> - Since there is no maintainer for this package, I can help maintain it,
> so add the package to the DEVELOPERS file.
> 
> [1] https://github.com/Azure/azure-c-shared-utility/pull/456
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  DEVELOPERS                                    |  1 +
>  ...0001-Fix-redirection-of-errno-header.patch | 32 +++++++++++++++++++
>  package/azure-iot-sdk-c/azure-iot-sdk-c.hash  |  5 +++
>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk    | 12 ++++---
>  4 files changed, 46 insertions(+), 4 deletions(-)
>  create mode 100644 package/azure-iot-sdk-c/0001-Fix-redirection-of-errno-header.patch
>  create mode 100644 package/azure-iot-sdk-c/azure-iot-sdk-c.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
