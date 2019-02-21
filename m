From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:31:28 +0100
Subject: [Buildroot] [PATCH] package/sg3_utils: ensure to build against
 librt when needed
In-Reply-To: <20190210135130.15117-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 10 Feb 2019 14:51:30 +0100")
References: <20190210135130.15117-1-thomas.petazzoni@bootlin.com>
Message-ID: <87bm35tou7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The sg3_utils has provisions to build against librt when needed, but
 > forgot to use that mechanism for the sg_turs program. This commit
 > fixes that. The patch has been submitted upstream to the sg3_utils
 > author.

 > Fixes:

 >   http://autobuild.buildroot.net/results/67b890a41d05497820ea4f44e187257dd6818b0b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
