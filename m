From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 21:24:47 +0200
Subject: [Buildroot] [PATCH v4 1/2] lockdev: add lockdev
In-Reply-To: <1368039327-10007-1-git-send-email-spenser@gillilanding.com>
References: <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
 <1368039327-10007-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130729212447.2099fc39@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed,  8 May 2013 13:55:26 -0500, Spenser Gilliland wrote:
> Add lockdev a package for locking devices.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in          |    1 +
>  package/lockdev/Config.in  |    4 ++++
>  package/lockdev/lockdev.mk |   41 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)
>  create mode 100644 package/lockdev/Config.in
>  create mode 100644 package/lockdev/lockdev.mk

Applied, thanks. I've moved the package to Libraries->Filesystem,
instead of the main "Hardware handling" menu.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
