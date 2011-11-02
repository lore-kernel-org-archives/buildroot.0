From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Nov 2011 11:46:30 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: Correct test for external
	tools symlink creation
In-Reply-To: <1320108819-2344-1-git-send-email-stanypub@gmail.com> (Stany
 MARCEL's message of "Tue, 1 Nov 2011 01:53:38 +0100")
References: <1320108819-2344-1-git-send-email-stanypub@gmail.com>
Message-ID: <87bosun6nt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stany" == Stany MARCEL <stanypub@gmail.com> writes:

 Stany> When the external tools chain is installed in a path that match one of
 Stany> the first case test, all symlink are created to the external
 Stany> wrapper. The proposed solution is to test only the base name not the
 Stany> full path.

Committed, thanks.

-- 
Bye, Peter Korsgaard
