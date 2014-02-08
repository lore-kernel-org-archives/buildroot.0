From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Feb 2014 22:54:12 +0100
Subject: [Buildroot] [PATCH 2/2] gpsd: disable for microblaze arch
In-Reply-To: <1391727417-12293-2-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Thu, 6 Feb 2014 23:56:57 +0100")
References: <1391727417-12293-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1391727417-12293-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87lhxl46ez.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > gpsd will fail on an internal compiler error for the microblaze
 > architecture so disabling it on that architecture.

 > Fixes:
 >   http://autobuild.buildroot.org/results/42d/42da870722f24e4202d8265597771a0449e74cfd

 > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

Committed with a comment added explaining why, thanks.

-- 
Bye, Peter Korsgaard
