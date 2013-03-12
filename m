From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 12 Mar 2013 22:32:08 +0100
Subject: [Buildroot] [PATCH] libv4l: depends on jpeg so must select it
In-Reply-To: <1363123025-8481-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 12 Mar 2013 22:17:05 +0100")
References: <1363123025-8481-1-git-send-email-arnout@mind.be>
Message-ID: <87fw00s3s7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Fixes http://autobuild.buildroot.net/results/3053854fccd65bc5b28384f2a2039a33abeeea47

 Arnout> The introduction of the error message for the jpeg virtual
 Arnout> package exposes this kind of error.

Committed, thanks.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---

 Arnout> Perhaps it would be nice to add this type of check to the
 Arnout> generic package infrastructure: if a package is built, it
 Arnout> should always be selected. Of course, that makes it impossible
 Arnout> to do a quick build of a package without reconfiguring, but we
 Arnout> can add another make variable that bypasses the check.

Yes, sounds like a nice feature. Care to cook up a patch for that?

-- 
Bye, Peter Korsgaard
