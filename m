From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:43:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libeXosip2: add optional
 support for c-ares
In-Reply-To: <1456009225-3822-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456009225-3822-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221144322.067948bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 00:00:25 +0100, Bernd Kuhls wrote:
> When c-ares was compiled before, libeXosip2 will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/sip_reg | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libcares.so.2]
> [...]
> 
> The build system offers no option to en-/disable c-ares support:
> http://git.savannah.gnu.org/cgit/exosip.git/tree/configure.in?h=exosip-3.X.X#n208
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libeXosip2/libeXosip2.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
