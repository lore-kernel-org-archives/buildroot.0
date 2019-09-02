From: Andreas Naumann <dev@andin.de>
Date: Mon, 2 Sep 2019 11:02:49 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libevdev: bump version to
 1.8.0
In-Reply-To: <20190831110107.4362-1-bernd.kuhls@t-online.de>
References: <20190831110107.4362-1-bernd.kuhls@t-online.de>
Message-ID: <b81056d1-03ef-2f36-5e72-181fb8e2602a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 31.08.19 um 13:01 schrieb Bernd Kuhls:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de> --- 
> package/libevdev/libevdev.hash | 10 +++++----- 
> package/libevdev/libevdev.mk   |  2 +- 2 files changed, 6
> insertions(+), 6 deletions(-)
> 
> diff --git a/package/libevdev/libevdev.hash
> b/package/libevdev/libevdev.hash index 5d17fec11f..3e93484143 100644 
> --- a/package/libevdev/libevdev.hash +++
> b/package/libevdev/libevdev.hash @@ -1,8 +1,8 @@ -# From
> https://lists.freedesktop.org/archives/input-tools/2019-June/001512.html
>
> 
-md5 fabe87d8d7d7f7cdb4a26e5dc99fc517 libevdev-1.7.0.tar.xz
> -sha1 418a06290c7a2f2ecaefca8b4d15e30e80428f61 libevdev-1.7.0.tar.xz 
> -sha256
> 11dbe1f2b1d03a51f3e9a196757a75c3a999042ce34cf1fdc00a2363e5a2e369
> libevdev-1.7.0.tar.xz -sha512
> bc43723fd1ca251a77ee549022609f73c15a33ae470fc843ac687542fb1938fba4d046d3ee1dc814bc38a4292a7f2ad9e71fcce45525b518a4f4a5bef099aa6f
> libevdev-1.7.0.tar.xz +# From
> https://lists.freedesktop.org/archives/input-tools/2019-August/001521.html
>
> 
+md5 879631080be18526737e33b63d848039  libevdev-1.8.0.tar.xz
> +sha1 4392d28fb91a5f6eb404aab531526f5fa0bbe73d
> libevdev-1.8.0.tar.xz +sha256
> 20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211
> libevdev-1.8.0.tar.xz +sha512
> 8d285632f4fe87c01e81f94e514bec4e37fed4bc44d6d38b9297dba1114e42f6ed8d143fc05f3d0e8d51b08b659e34481dc4c65f60421c54e2f3e11efbafdeb4
> libevdev-1.8.0.tar.xz
> 
> # Hash for license files: sha256
> f063d1279b31e73007e1c54493391818b4cb5f9162d590120397e0347b932137
> COPYING diff --git a/package/libevdev/libevdev.mk
> b/package/libevdev/libevdev.mk index 27b1615482..0b5a526bab 100644 
> --- a/package/libevdev/libevdev.mk +++
> b/package/libevdev/libevdev.mk @@ -4,7 +4,7 @@ # 
> ################################################################################
>
>  -LIBEVDEV_VERSION = 1.7.0 +LIBEVDEV_VERSION = 1.8.0 LIBEVDEV_SITE =
> http://www.freedesktop.org/software/libevdev LIBEVDEV_SOURCE =
> libevdev-$(LIBEVDEV_VERSION).tar.xz LIBEVDEV_LICENSE = X11
> 

I have successfully compiled and tested runtime with evemu-record/play
on a custom imx6 board with prebuilt toolchain
armv7-eabihf--glibc--stable-2018.11-1 and kernel 4.19.

Reviewed-by: Andreas Naumann <anaumann@ultratronik.de>
Tested-by: Andreas Naumann <anaumann@ultratronik.de>

Best regards,
Andreas
