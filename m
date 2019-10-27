From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 09:45:26 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: powerpc64le requires
 libgcrypt
In-Reply-To: <20191027063346.13992-1-matthew.weber@rockwellcollins.com>
References: <20191027063346.13992-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191027094526.2d4a3286@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 01:33:46 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> This patch adds the libgcrypt dependency for rngd_darn support
> when building for the specific BR2_powerpc64le archtecture.
> This entropy source is only enabled when powerpc64le is selected.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a41/a412ccef864e8279dcc917e106b5f7b515ed95da/
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/rng-tools/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
