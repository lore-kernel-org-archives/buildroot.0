From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 13 Oct 2012 22:25:08 +0200
Subject: [Buildroot] [PATCH] unionfs: convert to cmake-package
In-Reply-To: <1350128769-13518-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 13 Oct 2012 13:46:09 +0200")
References: <1350128769-13518-1-git-send-email-arnout@mind.be>
Message-ID: <87sj9i15nf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> Fixes e.g. http://autobuild.buildroot.net/results/c279007dd8b89a1c6fc9b58d3c2cda01ab84279e
 Arnout> The addition of CPPFLAGS overrides the defines added in unionfs's
 Arnout> Makefile.  Since unionfs now has CMake support, use that instead.

Committed, thanks.

-- 
Bye, Peter Korsgaard
