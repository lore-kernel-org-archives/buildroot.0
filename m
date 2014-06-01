From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2014 21:35:44 +0200
Subject: [Buildroot] [PATCH] mpg123: bump to 1.20.0,
	providing better optimizations for ARM and AArch64
In-Reply-To: <1401628284-23998-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 1 Jun 2014 15:11:24 +0200")
References: <1401628284-23998-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3904e3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As suggested by Gustavo, this patch bumps mpg123 to 1.20.0, and
 > therefore superseds the patch initially provided by Sven Neumann. In
 > 1.20.0, there is a new CPU type arm_fpu, which will compile code for
 > both VFP and NEON, and choose at runtime which one to use.

 > Similarly for AArch64, the option --with-cpu=aarch64 will compile both
 > the NEON and generic decoders, and select at runtime which one to use.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
