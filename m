From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Feb 2014 22:52:43 +0100
Subject: [Buildroot] [PATCH 1/2] dmraid: disable on ARC arch
In-Reply-To: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Thu, 6 Feb 2014 23:56:56 +0100")
References: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87ppmx46hg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > The ARC compiler has an internal failure while compiling this package
 > so disable this package for this architecture.

 > Fixes:
 >   http://autobuild.buildroot.net/results/ef6/ef6a0e2d382ae202bb8f0e9fc9f5e48c90119faf

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed with a comment added explaining why, thanks.

-- 
Bye, Peter Korsgaard
