From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jul 2014 11:43:54 +0200
Subject: [Buildroot] [PATCH 1/2] xlib_libFS: Add missing host-pkgconf
 dependency
In-Reply-To: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405809671-4609-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140720114354.1cd3cef1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 20 Jul 2014 00:41:10 +0200, Bernd Kuhls wrote:
> Fixes compile error:
> 
> checking for FS... configure: error: in `/home/br/br/output/build/xlib_libFS-1.0.6':
> configure: error: The pkg-config script could not be found or is too old.  Make sure it
> is in your PATH or set the PKG_CONFIG environment variable to the full
> path to pkg-config.
> 
> Alternatively, you may set the environment variables FS_CFLAGS
> and FS_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> 
> To get pkg-config, see <http://pkg-config.freedesktop.org/>.
> See `config.log' for more details
> 
> using this minimal defconfig
> 
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XAPP_XFS=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
