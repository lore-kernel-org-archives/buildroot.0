From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 19:11:41 +0200
Subject: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-input-keyboard: Fix compile error
In-Reply-To: <1429375169-23279-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429375169-23279-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150418191141.6027595a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 18 Apr 2015 18:39:29 +0200, Bernd Kuhls wrote:
> lnx_kbd.c: In function 'OpenKeyboard':
> lnx_kbd.c:194:8: error: implicit declaration of function 'getpgid' [-Werror=implicit-function-declaration]
>         rc = tcsetpgrp(pInfo->fd, getpgid(0));
>         ^
> lnx_kbd.c:194:8: warning: nested extern declaration of 'getpgid' [-Wnested-externs]
> cc1: some warnings being treated as errors
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.mk  |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
