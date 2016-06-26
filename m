From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/libxcb: force the use of
 python2
In-Reply-To: <1466894615-14358-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466894615-14358-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160626145800.722628dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 00:43:35 +0200, Bernd Kuhls wrote:
> libxcb in its current state is not python3-compatible:
> https://bugs.freedesktop.org/show_bug.cgi?id=96395
> 
> Fixes
> http://autobuild.buildroot.net/results/c74/c74fa243bf319472dca66982323df6c2a983642b/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/libxcb/libxcb.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
