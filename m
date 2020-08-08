From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 18:33:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: bump version to
 0.11.17
In-Reply-To: <20200808131356.852691-1-alejandro.gonzalez.correo@gmail.com>
References: <20200808131356.852691-1-alejandro.gonzalez.correo@gmail.com>
Message-ID: <20200808183311.17213e73@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  8 Aug 2020 15:13:56 +0200
Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> wrote:

> This commit bumps stress-ng version to 0.11.17.
> 
> This version includes the patch that fixes musl build at commit
> 03416938871388243d28621f4b59ce532231f11c, and also fixes a
> "Invalid syntax in conditional" build error in a Makefile.
> 
> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> ---
>  ...tress-ng.h-suppress-kernel-sysinfo.h.patch | 49 -------------------
>  package/stress-ng/stress-ng.hash              |  2 +-
>  package/stress-ng/stress-ng.mk                |  2 +-
>  3 files changed, 2 insertions(+), 51 deletions(-)
>  delete mode 100644 package/stress-ng/0001-stress-ng.h-suppress-kernel-sysinfo.h.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
