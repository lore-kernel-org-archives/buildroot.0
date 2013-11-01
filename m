From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 16:37:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] sysvinit: install new cmds and fix
 inittab
In-Reply-To: <1383173732-19980-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1383173732-19980-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20131101163738.5ed1c20b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Wed, 30 Oct 2013 17:55:32 -0500, Ryan Barnett wrote:
> Adding support for sysvinit to install reboot, poweroff, and pidof
> commands available in /sbin.
> 
> Fixes bug #6620
> 
> Removed uninstall commands since they aren't used.
> 
> There is an error with sysvinit that will prevent the system from booting
> if "dshm::sysinit:/bin/mkdir -p /dev/shm" is not present in the inittab.
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  package/sysvinit/inittab     |    1 +
>  package/sysvinit/sysvinit.mk |   11 ++++-------
>  2 files changed, 5 insertions(+), 7 deletions(-)

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
