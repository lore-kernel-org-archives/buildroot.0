From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:19:13 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/rng-tools: needs autoreconf
In-Reply-To: <20191117185936.8945-1-fontaine.fabrice@gmail.com>
References: <20191117185936.8945-1-fontaine.fabrice@gmail.com>
Message-ID: <20191118211913.1e71b68d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Nov 2019 19:59:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit b6606937d861cc4de60e40baec1cb6cdb61b2aab wrongly removed
> RNG_TOOLS_AUTORECONF=YES
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a0a4631cc0252579b675a0c401a99239d0b97392
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/rng-tools/rng-tools.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
