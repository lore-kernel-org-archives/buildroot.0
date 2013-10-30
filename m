From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 18:45:34 +0100
Subject: [Buildroot] [PATCH] arch/mips: Set BR2_GCC_TARGET_ARCH for MIPS
In-Reply-To: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
References: <1382970069-16449-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20131030184534.7bf2477b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 28 Oct 2013 14:21:09 +0000, Markos Chandras wrote:
> Set --with-arch instead of --with-tune for MIPS so that the
> generated code will be optimal for the given MIPS ISA.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

Applied to for-peter-2013.11, a branch that I will ask Peter to pull
when he comes back. I will mark such patches as Accepted in patchwork,
making the (maybe optimistic) assumption that Peter will pull my entire
branch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
