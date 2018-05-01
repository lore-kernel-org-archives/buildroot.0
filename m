From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 May 2018 08:56:22 +0200
Subject: [Buildroot] [PATCH 1/2] configs/solidrun_macchiatobin_*: use a
 Git commit for ATF
In-Reply-To: <20180423195954.30215-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 23 Apr 2018 21:59:53 +0200")
References: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736zbn9t5.fsf@dell.be.48ers.dk>
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

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
