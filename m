From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 14:10:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: add optional support for
 gettext
In-Reply-To: <20170312124314.19848-1-bernd.kuhls@t-online.de>
References: <20170312124314.19848-1-bernd.kuhls@t-online.de>
Message-ID: <20170312141040.368f9a18@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 13:43:14 +0100, Bernd Kuhls wrote:
> git links to libintl if available:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/git | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.0]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/git/git.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
