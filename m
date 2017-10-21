From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 15:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] freerdp: bump to 2.0.0-rc0
In-Reply-To: <20171018000711.29998-1-Adamduskett@outlook.com>
References: <20171018000711.29998-1-Adamduskett@outlook.com>
Message-ID: <20171021154954.4746d0ba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 20:07:11 -0400, Adam Duskett wrote:
> Remove patches that has been merged/updated upstream
> 
> 0001-fix-building-shared-libs.patch:
> CmakeLists packages are rewritten.
> 
> 0002-add-support-for-tz-package:
> https://github.com/FreeRDP/FreeRDP/commit/dd93fd2b3de7bef3f4faebfe04448344a0a5ab88
> 
> 0003-add-missing-define.patch:
> https://github.com/FreeRDP/FreeRDP/commit/656b3be02d22a52957903e3c89660ffb0247307b
> 
> 0004-ffmpeg30.patch:
> https://github.com/FreeRDP/FreeRDP/commit/b7b66968f93f6ce75dd06d12638e14029bf3717b
> 
> Also add sha256sum for license file.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  .../freerdp/0001-fix-building-shared-libs.patch    | 26 --------
>  .../freerdp/0002-add-support-for-tz-package.patch  | 30 ---------
>  package/freerdp/0003-add-missing-define.patch      | 44 -------------
>  package/freerdp/0004-ffmpeg30.patch                | 74 ----------------------
>  package/freerdp/freerdp.hash                       |  3 +-
>  package/freerdp/freerdp.mk                         |  2 +-
>  6 files changed, 3 insertions(+), 176 deletions(-)
>  delete mode 100644 package/freerdp/0001-fix-building-shared-libs.patch
>  delete mode 100644 package/freerdp/0002-add-support-for-tz-package.patch
>  delete mode 100644 package/freerdp/0003-add-missing-define.patch
>  delete mode 100644 package/freerdp/0004-ffmpeg30.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
