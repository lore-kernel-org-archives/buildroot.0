From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Oct 2018 19:41:07 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: fix TestATFMarvell
 test case
In-Reply-To: <20181014132559.2262-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 14 Oct 2018 15:25:59 +0200")
References: <20181014132559.2262-1-thomas.petazzoni@bootlin.com>
 <20181014132559.2262-2-thomas.petazzoni@bootlin.com>
Message-ID: <878t30qvd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This test case uses a too old U-Boot version, which is affected by the
 > infamous libfdt header conflict issue. We update U-Boot and ATF to
 > what is used in the current version of
 > solidrun_macchiatobin_mainline_defconfig, for which the problem no
 > longer exists.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/107860312

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
