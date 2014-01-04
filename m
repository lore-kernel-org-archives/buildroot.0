From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 04 Jan 2014 21:06:27 +0100
Subject: [Buildroot] [PATCH] zmqpp: fix license information
In-Reply-To: <1388832344-3725-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sat, 4 Jan 2014 10:45:44 +0000")
References: <1388832344-3725-1-git-send-email-spdawson@gmail.com>
Message-ID: <87wqif7br0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > Commit 85d28790cdbaa68179632aca7e5708fead7614f0 bumped the zmqpp Git
 > snapshot to 30d72d95f2cfdf9c5cedfd56747f549d65e65847.

 > However, the zmqpp licensing has changed (from MIT to
 > "LGPLv3+ with exceptions"), and the license file names have changed.

 > Fixes autobuild failures such as the following.

 >   http://autobuild.buildroot.net/results/a60/a6029fcb670cd27687a68cb96f0f14f5c13caf47

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
