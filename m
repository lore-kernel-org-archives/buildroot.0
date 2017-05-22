From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 15:39:52 +0200
Subject: [Buildroot] [PATCH/next] package/c-periphery: bump version to
 1.1.1
In-Reply-To: <20170521214632.22535-1-bernd.kuhls@t-online.de>
References: <20170521214632.22535-1-bernd.kuhls@t-online.de>
Message-ID: <20170522153952.3e88db5b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 May 2017 23:46:32 +0200, Bernd Kuhls wrote:
> Removed patches applied upstream:
> 
> 0001-Add-missing-header-for-musl-compatibility.patch
> https://github.com/vsergeev/c-periphery/commit/27a95527201a368c825aeaf937700c279e13922a
> 
> 0002-Fix-build-on-SPARC.patch
> https://github.com/vsergeev/c-periphery/commit/114c715c78ce300a5cd64fb71f32ffd2bce5326c
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...Add-missing-header-for-musl-compatibility.patch | 32 ----------
>  package/c-periphery/0002-Fix-build-on-SPARC.patch  | 70 ----------------------
>  package/c-periphery/c-periphery.hash               |  2 +-
>  package/c-periphery/c-periphery.mk                 |  2 +-
>  4 files changed, 2 insertions(+), 104 deletions(-)
>  delete mode 100644 package/c-periphery/0001-Add-missing-header-for-musl-compatibility.patch
>  delete mode 100644 package/c-periphery/0002-Fix-build-on-SPARC.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
