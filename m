From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Dec 2015 16:11:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.19.12
In-Reply-To: <1451083664-12505-1-git-send-email-joerg.krause@embedded.rocks>
References: <1451083664-12505-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151226161108.6361d018@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?rg,

On Fri, 25 Dec 2015 23:47:44 +0100, J?rg Krause wrote:
> Drop patch "Makefile.am: fix static build with alsa" - applied upstream.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/0003-fix-static-build-with-alsa.patch | 32 -----------------------
>  package/mpd/mpd.hash                              |  2 +-
>  package/mpd/mpd.mk                                |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/mpd/0003-fix-static-build-with-alsa.patch

This patch was patching Makefile.am, and we did not had AUTORECONF =
YES, which was bad. But now, it is no longer needed.

So, applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
