From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:40:17 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/vlc: also use AC_PATH_PROG
 to check for wayland-scanner
In-Reply-To: <20180826110452.18151-1-bernd.kuhls@t-online.de>
References: <20180826110452.18151-1-bernd.kuhls@t-online.de>
Message-ID: <20180906214017.17e3c869@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Aug 2018 13:04:52 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/a6b/a6b5e5677efc2b46af85837637f2832eefdfed1d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...o-use-AC_PATH_PROG-to-check-for-wayl.patch | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 package/vlc/0011-configure.ac-also-use-AC_PATH_PROG-to-check-for-wayl.patch

Applied to next, thanks. Please don't forget to submit the patch
upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
