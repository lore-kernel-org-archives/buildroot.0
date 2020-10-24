From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:45:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/mrouted: bump to version 4.1
In-Reply-To: <20201022060752.126304-1-fontaine.fabrice@gmail.com>
References: <20201022060752.126304-1-fontaine.fabrice@gmail.com>
Message-ID: <20201024224514.641b6922@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 22 Oct 2020 08:07:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball
> - Update license hash, reformatting:
>   https://github.com/troglobit/mrouted/commit/206f9325608d2f538254e26848aeb9bfb32e07e5
> - Switch to autotools, available since version 4.0 and
>   https://github.com/troglobit/mrouted/commit/1a7ef3759f49195db176667e73879f1ba9514527
> - Install systemd file, available since version 4.0 and
>   https://github.com/troglobit/mrouted/commit/18f0fe763076ff735981d9499b68df68b0e1a8db
> - Update indentation in hash file (two spaces)
> 
> https://github.com/troglobit/mrouted/releases/tag/4.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mrouted/mrouted.hash |  7 +++++--
>  package/mrouted/mrouted.mk   | 23 ++++++++---------------
>  2 files changed, 13 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
