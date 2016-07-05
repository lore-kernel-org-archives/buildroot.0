From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:21:28 +0200
Subject: [Buildroot] [PATCH] libiio: Bump version to 0.7
In-Reply-To: <1467714448-19177-1-git-send-email-paul.cercueil@analog.com>
References: <1467714448-19177-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <20160705172128.3e25f4f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 5 Jul 2016 12:27:28 +0200, Paul Cercueil wrote:
> The two previous patches have been merged upstream, so they have been
> deleted here. Another patch (picked from upstream) has been added to fix
> the build with thread-less toolchains.
> 
> Libiio v0.7 provides two new backends, a USB backend (using libusb-1.0)
> and a serial backend (using libserialport).
> 
> Additionally, it is now possible to compile libiio with thread-less
> toolchains. In that case, thread safety is disabled.
> 
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> ---
>  ...l2-detection-try-first-the-CMake-module-f.patch | 43 ----------------------
>  ...t-include-pthread.h-if-NO_THREADS-is-defi.patch | 26 +++++++++++++
>  ...IIOD-Link-pthread-with-no-network-backend.patch | 30 ---------------
>  package/libiio/Config.in                           | 31 ++++++++++++++--
>  package/libiio/libiio.hash                         |  4 +-
>  package/libiio/libiio.mk                           | 23 ++++++++++--
>  6 files changed, 74 insertions(+), 83 deletions(-)
>  delete mode 100644 package/libiio/0001-cmake-libxml2-detection-try-first-the-CMake-module-f.patch
>  create mode 100644 package/libiio/0001-lock.c-Don-t-include-pthread.h-if-NO_THREADS-is-defi.patch
>  delete mode 100644 package/libiio/0002-IIOD-Link-pthread-with-no-network-backend.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
