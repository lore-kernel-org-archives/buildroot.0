From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:42:03 +0100
Subject: [Buildroot] [PATCH] xenomai: use install-user to remove patch
In-Reply-To: <1383172905-22699-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383172905-22699-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131101154203.746aa824@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Wed, 30 Oct 2013 23:41:45 +0100, Thomas Petazzoni wrote:
> As noted by "George" in bug #6416, the xenomai-do-not-install-devices
> patch is not needed, since Xenomai provides a "install-user" target to
> only install the libraries/headers and not the device files. This
> patch changes xenomai.mk to use 'install-user' and removes the useless
> patch.
> 
> Fixes bug #6416.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/xenomai/xenomai-do-not-install-devices.patch | 11 -----------
>  package/xenomai/xenomai.mk                           |  2 ++
>  2 files changed, 2 insertions(+), 11 deletions(-)
>  delete mode 100644 package/xenomai/xenomai-do-not-install-devices.patch

Applied to for-peter-2013.11, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
