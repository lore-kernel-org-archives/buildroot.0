From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:51:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xserver_xorg-server: bump
 to version 1.17.2
In-Reply-To: <1434482303-10091-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434482303-10091-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150621065106.70a1e5b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Tue, 16 Jun 2015 21:18:22 +0200, Bernd Kuhls wrote:
> Removed patches committed upstream:
> http://cgit.freedesktop.org/xorg/xserver/commit/os/backtrace.c?h=server-1.17-branch&id=8b7e1f362bf6940eb863fd02395bf8155d10604b
> http://cgit.freedesktop.org/xorg/xserver/commit/hw/xfree86/sdksyms.sh?h=server-1.17-branch&id=7a45d1684f626f3045305328c3aab85eed0673ea
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...01-backtrace.c-Fix-word-cast-to-a-pointer.patch |   90 --------------------
>  ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch |   52 -----------
>  package/x11r7/xserver_xorg-server/Config.in        |    4 +-
>  .../xserver_xorg-server/xserver_xorg-server.hash   |    6 +-
>  4 files changed, 5 insertions(+), 147 deletions(-)
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.17.1/0001-backtrace.c-Fix-word-cast-to-a-pointer.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.17.1/0002-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
