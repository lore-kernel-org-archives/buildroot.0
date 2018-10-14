From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Oct 2018 19:40:53 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: fix TestATFAllwinner
 test case
In-Reply-To: <20181014132559.2262-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 14 Oct 2018 15:25:58 +0200")
References: <20181014132559.2262-1-thomas.petazzoni@bootlin.com>
Message-ID: <87d0scqvdm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This test case uses a too old U-Boot version, which is affected by the
 > infamous libfdt header conflict issue. Let's update to U-Boot 2017.11,
 > which is used by our current bananapi_m64_defconfig that was the
 > inspiration for this test case.

 > Fixes:

 >   https://gitlab.com/buildroot.org/buildroot/-/jobs/107860310

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
