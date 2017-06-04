From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:46:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/gmrender-resurrect: bump version
In-Reply-To: <20170603180430.5091-1-bernd.kuhls@t-online.de>
References: <20170603180430.5091-1-bernd.kuhls@t-online.de>
Message-ID: <20170604094631.36b2d5fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 20:04:30 +0200, Bernd Kuhls wrote:
> gmrender-resurrect now builds with musl after
> https://github.com/hzeller/gmrender-resurrect/commit/4ebbb5cabee79aefd88e0cffc8655dd703512e7a
> removed the usage of error.h.
> 
> Build tested based on
> http://autobuild.buildroot.net/toolchains/configs/br-x86-64-musl.config
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gmrender-resurrect/Config.in               | 7 ++-----
>  package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
>  package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
>  3 files changed, 4 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
