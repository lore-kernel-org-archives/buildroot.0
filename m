From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Jul 2019 15:47:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgtk2: fix build with NLS
In-Reply-To: <20190714083019.6238-1-fontaine.fabrice@gmail.com>
References: <20190714083019.6238-1-fontaine.fabrice@gmail.com>
Message-ID: <20190721154700.55a55d32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 14 Jul 2019 10:30:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/20644475a745c04fec4a87c639bd13e4f333805a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libgtk2/libgtk2.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
