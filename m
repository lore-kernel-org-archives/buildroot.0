From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jul 2016 22:15:41 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: musl toolchain on
	ARM is for MMU-systems only
In-Reply-To: <1469713154-10898-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 28 Jul 2016 15:39:14 +0200")
References: <1469713154-10898-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1469713154-10898-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wpk5tt76.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Now that we have introduced the support for ARM no-MMU in Buildroot,
 > we need to update the dependencies of the musl external toolchain. It
 > supports only MMU-capable ARM cores, so it must depend on BR2_USE_MMU,
 > at least for the ARM platforms.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
