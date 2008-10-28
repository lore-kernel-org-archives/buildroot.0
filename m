From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Oct 2008 10:40:16 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix adjustment of qmake.conf
In-Reply-To: <200810280254.32049.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Tue\, 28 Oct 2008 02\:54\:31 +0100")
References: <200810280254.32049.markus.heidelberg@web.de>
Message-ID: <877i7tcb27.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> Extend the regexp to match spaces and also tabs to replace the qmake
 Markus> variables with the proper buildroot values. Also use TARGET_AR and
 Markus> TARGET_STRIP instead of using TARGET_CROSS and set a variable for
 Markus> qmake.conf to shorten the command line.

Thanks, committed.

Could I get you to sign off on the patches (-s option to git
format-patch)? Then I don't have to git commit --amend to mention that
you are the author of the commit.

-- 
Bye, Peter Korsgaard
