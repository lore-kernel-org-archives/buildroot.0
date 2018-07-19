From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Jul 2018 09:44:13 +0200
Subject: [Buildroot] [PATCH] Use TARGET_LDFLAGS for cmake shared and
 module libraries
In-Reply-To: <205aa775588289b4db7f1ce200b32a9c1500b6ba.camel@vitec.com>
References: <205aa775588289b4db7f1ce200b32a9c1500b6ba.camel@vitec.com>
Message-ID: <20180719094413.2f7e0292@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Jul 2018 06:52:13 +0000, Damien Th?bault wrote:
> With cmake packages, we are only using TARGET_LDFLAGS for executables
> and not for shared libraries.
> 
> This patch adds CMAKE_SHARED_LINKER_FLAGS and CMAKE_MODULE_LINKER_FLAGS
> to the cmake toolchain file so that buildroot TARGET_LDFLAGS are used
> for shared and module libraries.
> 
> Signed-off-by: Damien Th?bault <damien.thebault@vitec.com>
> ---
>  support/misc/toolchainfile.cmake.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. We'll see how much build breakage this will
cause (or not?) in the next days :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
