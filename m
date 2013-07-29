From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 21:31:31 +0200
Subject: [Buildroot] [PATCH v4 2/2] libcec: add libcec for HDMI device
 Control
In-Reply-To: <1368039327-10007-2-git-send-email-spenser@gillilanding.com>
References: <1367964142-23036-1-git-send-email-spenser@gillilanding.com>
 <1368039327-10007-1-git-send-email-spenser@gillilanding.com>
 <1368039327-10007-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130729213131.1dfaec6e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed,  8 May 2013 13:55:27 -0500, Spenser Gilliland wrote:
> This patch adds libcec for HDMI device control.  It enables Raspberry Pi
> support if the rpi-userland package is installed.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/Config.in        |    1 +
>  package/libcec/Config.in |    8 ++++++++
>  package/libcec/libcec.mk |   33 +++++++++++++++++++++++++++++++++
>  3 files changed, 42 insertions(+)
>  create mode 100644 package/libcec/Config.in
>  create mode 100644 package/libcec/libcec.mk

Thanks, applied, after adding the missing C++ dependency.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
