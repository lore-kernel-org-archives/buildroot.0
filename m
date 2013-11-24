From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Nov 2013 12:31:53 +0100
Subject: [Buildroot] [PATCH 1/1] nut: add libltdl dependency
In-Reply-To: <1385232385-8527-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 23 Nov 2013 19:46:25 +0100")
References: <1385232385-8527-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87fvqmm3x2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > libltdl is needed for nut-scanner
 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

Do you think this fixes:

http://autobuild.buildroot.net/results/7e4/7e4e369dc5640619e95983ad0b4571f3a3f0d84b/build-end.log

Or is that another problem?

-- 
Bye, Peter Korsgaard
