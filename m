From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 09:56:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/openocd: fix uclinux build
In-Reply-To: <20170817043740.9142-1-bernd.kuhls@t-online.de>
References: <20170817043740.9142-1-bernd.kuhls@t-online.de>
Message-ID: <20170817095637.0b890850@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Aug 2017 06:37:39 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/cd3/cd3f5b7329f45c2b75ed319caef3c6aa0e94ee2e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-configure-enable-build-on-uclinux.patch   | 26 ++++++++++++++++++++++
>  package/openocd/openocd.mk                         |  3 ++-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 package/openocd/0002-configure-enable-build-on-uclinux.patch

Both applied, thanks. Please remember to use "git format-patch -N" when
generating patches. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
