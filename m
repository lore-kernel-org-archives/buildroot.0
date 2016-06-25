From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Jun 2016 00:59:15 +0200
Subject: [Buildroot] [PATCH] package/x11r7/libxcb: force the use of
	python2
References: <1466894944-15317-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <3ve34dxcdm.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 26 Jun 2016 00:49:04 +0200 schrieb Bernd Kuhls:

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

Hi,

forget this one, I already sent http://patchwork.ozlabs.org/patch/640596/

It's getting late, sorry for the noise...

Regards, Bernd
