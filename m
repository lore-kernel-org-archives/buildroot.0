From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 14:46:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/log4cpp: force autoreconf
In-Reply-To: <20170903115337.23832-1-bernd.kuhls@t-online.de>
References: <20170903115337.23832-1-bernd.kuhls@t-online.de>
Message-ID: <20170903144600.4d58d1cc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 13:53:37 +0200, Bernd Kuhls wrote:
> The upstream provided configure script produces a broken
> log4cpp-1.1.3/log4cpp/include/log4cpp/config.h file with its custom
> AC_CREATE_PREFIX_CONFIG_H m4 macro.
> Running autoreconf fixes this problem.
> 
> Fixes
> http://autobuild.buildroot.net/results/9be/9be23d91098d2f3724bb9535333fed8d27ef992a/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/log4cpp/log4cpp.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. Could you report the bug upstream? Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
