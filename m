From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:34:41 +0200
Subject: [Buildroot] [PATCH 1/2] libselinux: remove library host symlink
In-Reply-To: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
References: <20181010212417.23047-1-fontaine.fabrice@gmail.com>
Message-ID: <20181011093441.69d21632@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 23:24:16 +0200, Fabrice Fontaine wrote:
> Since bump to version 2.7 and addition of
> 0003-revert-ln-relative.patch, the creation of a symlink through
> ln -sf libselinux.so.1 $(HOST_DIR)/lib/libselinux.so
> is not needed anymore so remove it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libselinux/libselinux.mk | 1 -
>  1 file changed, 1 deletion(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
