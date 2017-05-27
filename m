From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:15:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libv4l: fix udev configure
 options
In-Reply-To: <20170527125708.5971-1-bernd.kuhls@t-online.de>
References: <20170527125708.5971-1-bernd.kuhls@t-online.de>
Message-ID: <20170527171528.2305f61c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 14:57:08 +0200, Bernd Kuhls wrote:
> AC_ARG_WITH([libudev] was removed in version 1.12.0:
> https://git.linuxtv.org/v4l-utils.git/commit/configure.ac?id=3aba7817cd1994e6da00651114368db8171eabcc
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libv4l/libv4l.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
