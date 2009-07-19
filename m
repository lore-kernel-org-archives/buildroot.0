From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Jul 2009 16:12:22 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <1244029145-11832-2-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Wed\, 3 Jun 2009 13\:39\:05 +0200")
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<1244029145-11832-2-git-send-email-daniel@caiaq.de>
Message-ID: <878wikg3sp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> Update git version for mtd-utils.git.
 Daniel> In this new version, a new tool named 'ubiformat' exists which is
 Daniel> exported by this patch.

What about the patches? They no longer apply:

Applying mtd-utils-all-targets.patch using plaintext: 
patching file Makefile
Hunk #1 FAILED at 72.
1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
Patch failed!  Please fix mtd-utils-all-targets.patch!

-- 
Bye, Peter Korsgaard
