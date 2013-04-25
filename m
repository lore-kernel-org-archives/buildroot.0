From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 25 Apr 2013 22:46:13 +0200
Subject: [Buildroot] [PATCH v2] fs/ubifs: factorize all the "depends on"
	into "if...endif" blocks
In-Reply-To: <5178E177.8060508@newflow.co.uk> (Mark Jackson's message of "Thu, 
 25 Apr 2013 08:55:35 +0100")
References: <5178E177.8060508@newflow.co.uk>
Message-ID: <8761za9w4q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Jackson <mpfj-list@newflow.co.uk> writes:

 Mark> Factorize all the "depends on" into "if...endif" blocks
 Mark> All the UBIFS options use "depends on BR2_TARGET_ROOTFS_UBIFS" but
 Mark> we can simplify the config file by enclosing them in an "if..endif"
 Mark> block.

Committed, thanks.

-- 
Bye, Peter Korsgaard
