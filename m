From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jan 2017 16:29:04 +1100
Subject: [Buildroot] [PATCH 1/1] package/uclibc: Fix removal of libintl.h
In-Reply-To: <20170116205903.26311-1-bernd.kuhls@t-online.de>
References: <20170116205903.26311-1-bernd.kuhls@t-online.de>
Message-ID: <20170117162904.6e80712b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Jan 2017 21:59:03 +0100, Bernd Kuhls wrote:
> Needed to fix
> http://autobuild.buildroot.net/results/6be/6be94fe2542f3ac9fb785dd22f504e25c2a7802e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...0004-Makefile.in-Fix-removal-of-libintl.h.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/uclibc/0004-Makefile.in-Fix-removal-of-libintl.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
