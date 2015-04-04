From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:12:20 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xlib_libXpm: Add
 gettext/iconv support
In-Reply-To: <1427638816-25585-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427638816-25585-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150404151220.00a15afd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 16:20:16 +0200, Bernd Kuhls wrote:
> This package uses gettext/iconv when needed
> 
> fli4l at fli4lbuild64:~/br5$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libXpm.so | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libxcb.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libXau.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libXdmcp.so.6]
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
>  0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
