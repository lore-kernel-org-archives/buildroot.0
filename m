From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:13:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/mraa: bump version to 0.9.1
In-Reply-To: <1454709441-31380-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454709441-31380-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160205231318.252a5f62@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  5 Feb 2016 22:57:21 +0100, Bernd Kuhls wrote:
> Removed patches applied upstream:
> https://github.com/intel-iot-devkit/mraa/commit/86a0e10c037e5c069c48012f169f9e8e2587a0ef
> https://github.com/intel-iot-devkit/mraa/commit/a87a104efeb83d4e762992e5be3b8908e6d2bf40
> https://github.com/intel-iot-devkit/mraa/commit/7fce2e2a3a3fbbaa2b645d810bde8a50b9c78023
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ake-build-shared-libs-by-default-on-linux.patch | 53 --------------------
>  ...keLists.txt-do-not-require-a-CXX-compiler.patch | 57 ----------------------
>  .../0003-uart.c-fix-build-with-musl-libc.patch     | 40 ---------------
>  package/mraa/mraa.mk                               |  2 +-
>  4 files changed, 1 insertion(+), 151 deletions(-)
>  delete mode 100644 package/mraa/0001-cmake-build-shared-libs-by-default-on-linux.patch
>  delete mode 100644 package/mraa/0002-CMakeLists.txt-do-not-require-a-CXX-compiler.patch
>  delete mode 100644 package/mraa/0003-uart.c-fix-build-with-musl-libc.patch

I've applied, but I had to remove the removal of
0003-uart.c-fix-build-with-musl-libc.patch, since the patch adding it
had never been applied.

Thanks a lot for having pushed this musl build fix upstream! It is
great to be able to simply bump the package without having to carry any
patch in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
