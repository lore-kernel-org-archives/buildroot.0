From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Oct 2013 16:48:48 +0200
Subject: [Buildroot] [PATCH] libevent: Add Gentoo patch for C libraries
 without the sysctl syscall
In-Reply-To: <1353495389-20179-1-git-send-email-markos.chandras@gmail.com>
References: <1353495389-20179-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <20131006164848.1af52324@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Wed, 21 Nov 2012 10:56:29 +0000, Markos Chandras wrote:
> From: Markos Chandras <markos.chandras@imgtec.com>
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
>  package/libevent/libevent-sysctl.patch |   46 ++++++++++++++++++++++++++++++++
>  package/libevent/libevent.mk           |    1 +
>  2 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 package/libevent/libevent-sysctl.patch

This patch was never applied to Buildroot, but libevent has been
updated to 2.0.21 recently, and my understanding is that the sysctl
problem is fixed in 2.0.21.

Therefore, I'm marking this patch as "non-applicable" in patchwork.
Do not hesitate to resend an updated patch if my understanding turns
out to be wrong.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
