From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 23:46:55 +0200
Subject: [Buildroot] [PATCH 2/2] valgrind: Add patch to fix ARM host
 detection
In-Reply-To: <1412107895-10015-3-git-send-email-mike@mikebwilliams.com>
References: <1412107895-10015-1-git-send-email-mike@mikebwilliams.com>
 <1412107895-10015-3-git-send-email-mike@mikebwilliams.com>
Message-ID: <20140930234655.59b05aa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Tue, 30 Sep 2014 16:11:35 -0400, Mike Williams wrote:
> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
> ---
>  ...-0003-Add-patch-to-fix-ARM_host-detection.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/valgrind/valgrind-0003-Add-patch-to-fix-ARM_host-detection.patch

This patch is not needed. You simply need to adjust the logic at
http://git.buildroot.net/buildroot/tree/package/valgrind/valgrind.mk#n15
to also cover Cortex-A5 and other Cortex-A variants.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
