From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 23:46:36 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170303234636.0dbf4fd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Mar 2017 22:50:16 +0100, Angelo Compagnucci wrote:
> This patch adds an easy way to select the CIP project SLTS
> kernel within the kernel menu.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I personally don't think we should have explicit support for kernels
other than the vanilla Linux kernel. Our kernel options already allow
to select any arbitrary tarball or Git repository, which makes it
possible to use this linux-cip Git repository as your kernel source if
you like it.

Supporting explicitly additional kernel trees is a never-ending story.
Everyone will want its own kernel tree listed in Buildroot.

And this linux-cip thing is in fact probably a lot less popular than
other non-vanilla kernel trees (like the one for RaspberryPi, for
BeagleoBone, the PREEMPT_RT tree, etc.).

So I apologize, but I'm personally not in favor of this patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
