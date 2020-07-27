From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:28:14 +0200
Subject: [Buildroot] [PATCH] package/c-periphery: bump to v2.2.2
In-Reply-To: <20200724115604.7741-1-ryanbarnett3@gmail.com>
References: <20200724115604.7741-1-ryanbarnett3@gmail.com>
Message-ID: <20200727152814.55a60155@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Jul 2020 06:56:04 -0500
Ryan Barnett <ryanbarnett3@gmail.com> wrote:

> c-periphery now supports building on older kernels before 4.8 as there
> are now checks for the new kernel cdev gpio interface.
> 
> Also updated hash file to two space format.
> 
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
> ---
>  ...MakeLists.txt-add-BUILD_TESTS-option.patch | 61 -------------------
>  package/c-periphery/Config.in                 |  4 --
>  package/c-periphery/c-periphery.hash          |  4 +-
>  package/c-periphery/c-periphery.mk            |  2 +-
>  4 files changed, 3 insertions(+), 68 deletions(-)
>  delete mode 100644 package/c-periphery/0001-CMakeLists.txt-add-BUILD_TESTS-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
