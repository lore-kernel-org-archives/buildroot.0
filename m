From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:14:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/flashrom: security bump to
 version 0.9.9
In-Reply-To: <20170528135611.10218-1-bernd.kuhls@t-online.de>
References: <20170528135611.10218-1-bernd.kuhls@t-online.de>
Message-ID: <20170528161427.35a09360@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 May 2017 15:56:11 +0200, Bernd Kuhls wrote:
> Fixes buffer overflow:
> https://mail.coreboot.org/pipermail/flashrom/2016-March/014523.html
> 
> Removed patch 0002-sys-io.h.patch, not needed anymore, hwaccess.h now
> contains a similar fix:
> 
>   elif defined(__linux__) || defined(__GLIBC__)
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/flashrom/0002-sys-io.h.patch | 27 ---------------------------
>  package/flashrom/flashrom.hash       |  2 +-
>  package/flashrom/flashrom.mk         |  2 +-
>  3 files changed, 2 insertions(+), 29 deletions(-)
>  delete mode 100644 package/flashrom/0002-sys-io.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
