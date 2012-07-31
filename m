From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:44:41 +0200
Subject: [Buildroot] [PATCHv4 0/6] Add some support for device tree
 kernels
In-Reply-To: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120731234441.72e899d1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Jul 2012 14:32:43 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

>  configs/s6lx9_microboard_defconfig |   12 +----
>  linux/Config.in                    |  101 +++++++++++++++++++++++++++++++++---
>  linux/linux.mk                     |   79 ++++++++++++++++++++++------
>  3 files changed, 158 insertions(+), 34 deletions(-)

I have now applied this patch set, including the small fix you
suggested for the linux.bin image problem I reported yesterday.

Thanks a lot for your persistence, I think it's great to have proper
support in Buildroot to generate DT-related kernel images.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
