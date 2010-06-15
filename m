From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jun 2010 10:50:27 +0200
Subject: [Buildroot] [PATCH] Fix potentially conflicting build flags
In-Reply-To: <1276518964-6695-1-git-send-email-paul@pauljones.id.au> (Paul
	Jones's message of "Mon, 14 Jun 2010 22:36:04 +1000")
References: <1276518964-6695-1-git-send-email-paul@pauljones.id.au>
Message-ID: <87ljagel2k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Jones <paul@pauljones.id.au> writes:

 Paul> Change the default target optimisation value so
 Paul> it does not conflict with gcc optimization level

Committed, thanks.

-- 
Bye, Peter Korsgaard
