From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:56:30 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: fix Marvell ATF source
 code
In-Reply-To: <20180423195954.30215-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 23 Apr 2018 21:59:54 +0200")
References: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
 <20180423195954.30215-2-thomas.petazzoni@bootlin.com>
Message-ID: <87y3h3lv8h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The version of the ARM Trusted Firmware from Marvell was a Git branch,
 > not a Git commit, leading to unreproducible results. So let's use a
 > Git commit instead, which is the latest available from the branch that
 > was previously used.

 > More specifically, this branch has recently seen a fix that is needed
 > for ATF to build properly with recent gcc versions:

 >   https://github.com/MarvellEmbeddedProcessors/atf-marvell/commit/c96ec59f8b819123a06e1839ab5578030cf263b0

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
