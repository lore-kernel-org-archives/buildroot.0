From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:11:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/ulogd: add optional support for
 jansson
In-Reply-To: <1455137935-18111-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137935-18111-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160216231153.6e747ad8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 10 Feb 2016 21:58:54 +0100, Bernd Kuhls wrote:
> When jansson was compiled before, ulogd will use it as optional
> dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/ulogd/ulogd_output_JSON.so | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libjansson.so.4]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ulogd/ulogd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both patches applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
