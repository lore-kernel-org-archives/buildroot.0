From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:02:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsvg: fix build with NLS
In-Reply-To: <20191026100851.21720-1-fontaine.fabrice@gmail.com>
References: <20191026100851.21720-1-fontaine.fabrice@gmail.com>
Message-ID: <20191026150213.1bf3e288@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 12:08:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/9fb04aa7761845a58df14d460b4a7bbf426e19ee
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/librsvg/librsvg.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
