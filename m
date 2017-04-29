From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:31:29 +0200
Subject: [Buildroot] [PATCH v7 02/31] package/libplatform: bump version
In-Reply-To: <20170429083751.19625-3-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-3-bernd.kuhls@t-online.de>
Message-ID: <20170429113129.0d975c0b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:22 +0200, Bernd Kuhls wrote:
> Replaced patch 0001 with an alternate solution.
> 
> Updated license info after
> https://github.com/Pulse-Eight/platform/commit/a1e5905874d5cdbce110344558d21a2810dead9c
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-p8-platform-config-fix-lookup-paths.patch | 38 ++++++++++++++++++++
>  ...nfig.cmake-fix-paths-for-cross-compilatio.patch | 40 ----------------------
>  package/libplatform/libplatform.hash               |  2 +-
>  package/libplatform/libplatform.mk                 |  6 ++--
>  4 files changed, 42 insertions(+), 44 deletions(-)
>  create mode 100644 package/libplatform/0001-p8-platform-config-fix-lookup-paths.patch
>  delete mode 100644 package/libplatform/0001-platform-config.cmake-fix-paths-for-cross-compilatio.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
