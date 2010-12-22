From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Dec 2010 22:19:47 +0100
Subject: [Buildroot] [PATCH 1/1] linux: don't force IPv6 configuration
	in kernel
In-Reply-To: <f585c31baa5c48eaff5f49534fd154f79575e7b5.1293043809.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 22 Dec 2010 19:50:17 +0100")
References: <cover.1293043809.git.thomas.petazzoni@free-electrons.com>
	<cover.1293043809.git.thomas.petazzoni@free-electrons.com>
	<f585c31baa5c48eaff5f49534fd154f79575e7b5.1293043809.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87sjxptsi4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As per the discussion at
 Thomas> http://lists.busybox.net/pipermail/buildroot/2010-December/040030.html,
 Thomas> remove the bits that forced the IPv6 configuration in the kernel
 Thomas> depending on the toolchain ability to support (or not) IPv6. You may
 Thomas> have a toolchain with IPv6 support but still don't want to have IPv6
 Thomas> in your kernel.

Committed, thanks.

-- 
Bye, Peter Korsgaard
