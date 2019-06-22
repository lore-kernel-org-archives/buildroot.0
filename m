From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:50:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/alsa-utils: bump to version
 1.1.9
In-Reply-To: <1561204558-23794-1-git-send-email-pjtexier@koncepto.io>
References: <1561204558-23794-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20190622175000.711aa026@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 13:55:58 +0200
Pierre-Jean Texier <pjtexier@koncepto.io> wrote:

> Also remove the patch that have been upstreamed
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  ...-topology.c-drop-unneeded-dlfcn.h-include.patch | 29 ----------------------
>  package/alsa-utils/alsa-utils.hash                 |  2 +-
>  package/alsa-utils/alsa-utils.mk                   |  2 +-
>  3 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 package/alsa-utils/0001-topology-topology.c-drop-unneeded-dlfcn.h-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
