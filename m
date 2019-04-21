From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:16:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/xlib_libXpm: fix build with NLS
In-Reply-To: <20190420204434.27015-1-fontaine.fabrice@gmail.com>
References: <20190420204434.27015-1-fontaine.fabrice@gmail.com>
Message-ID: <20190421121632.10d53269@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Apr 2019 22:44:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/cc47a39d134fbc80426bab6fa3662150374bae35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/x11r7/xlib_libXpm/xlib_libXpm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
