From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 15:26:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvips: fix build with NLS
In-Reply-To: <20190705205048.18441-1-fontaine.fabrice@gmail.com>
References: <20190705205048.18441-1-fontaine.fabrice@gmail.com>
Message-ID: <20190720152657.7289bcbe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  5 Jul 2019 22:50:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/cd61be84dc9781ea645f7667c2bd29908484692f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvips/libvips.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
