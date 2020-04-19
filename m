From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 22:41:24 +0200
Subject: [Buildroot] [PATCH 2/2] package/lvm2: lvmetad integration
In-Reply-To: <20200302074950.4710-1-p.debruijn@unilogic.nl>
References: <20200302074950.4710-1-p.debruijn@unilogic.nl>
Message-ID: <20200419224124.2c2939ae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  2 Mar 2020 08:49:50 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> lvmetad is usually combined with event-based system services that
> automatically run pvscan --cache on disks added or removed.  This
> way, the cache is automatically updated with metadata from new disks
> when they appear.  LVM udev rules and systemd services implement this
> automation.  Automatic scanning is usually combined with automatic
> activation.  For more information, see pvscan(8).
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/lvm2/Config.in | 13 +++++++++++++
>  package/lvm2/lvm2.mk   |  6 ++++++
>  2 files changed, 19 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
