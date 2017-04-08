From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 15:21:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpthread-stubs: bump version
 to 0.4
In-Reply-To: <20170408084325.2830-1-bernd.kuhls@t-online.de>
References: <20170408084325.2830-1-bernd.kuhls@t-online.de>
Message-ID: <20170408152108.12a4440b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Apr 2017 10:43:25 +0200, Bernd Kuhls wrote:
> libdrm 2.4.77 needs it since
> https://cgit.freedesktop.org/mesa/drm/commit/?id=63120172668610cebfd01e89f67e73037037dfd9
> 
> Fixes:
> http://autobuild.buildroot.net/results/732/732652f34f4865462007a3ebeb40d6642fde028b/
> http://autobuild.buildroot.net/results/b5d/b5d7667737c92de5d19313ec6bb0ec9ce81707ea/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libpthread-stubs/libpthread-stubs.hash | 4 ++--
>  package/libpthread-stubs/libpthread-stubs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
