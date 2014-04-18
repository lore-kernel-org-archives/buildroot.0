From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Apr 2014 23:53:10 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_xwd: Add missing dependency
 xlib_libxkbfile
In-Reply-To: <1397802848-4446-1-git-send-email-bernd.kuhls@t-online.de>
References: <1397802848-4446-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140418235310.285cc2c0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 18 Apr 2014 08:34:08 +0200, Bernd Kuhls wrote:
> Fixes http://autobuild.buildroot.net/results/12b/12b7894a4f67d963ea93622eea1adc2d2c3d6847/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xapp_xwd/Config.in   |    1 +
>  package/x11r7/xapp_xwd/xapp_xwd.mk |    2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
