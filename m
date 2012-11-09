From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 10:25:42 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <1352425626-10628-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 9 Nov 2012 02:47:05 +0100")
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
Message-ID: <87fw4j6sbt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> The perlcross project makes it possible to properly cross-compile
 Arnout> perl.  It creates a host-miniperl that is configured for the target
 Arnout> and uses that to cross-compile the perl modules.

Committed, thanks.

-- 
Bye, Peter Korsgaard
