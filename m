From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 10:09:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/linux-zigbee: use official
 tarball
In-Reply-To: <20191027085522.21705-1-fontaine.fabrice@gmail.com>
References: <20191027085522.21705-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027100926.04c81b3d@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 09:55:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use official tarball instead of using git
> - Add linux-zigbee.hash
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/linux-zigbee/linux-zigbee.hash | 3 +++
>  package/linux-zigbee/linux-zigbee.mk   | 6 ++++--
>  2 files changed, 7 insertions(+), 2 deletions(-)
>  create mode 100644 package/linux-zigbee/linux-zigbee.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
