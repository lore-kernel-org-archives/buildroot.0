From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:12:15 +0200
Subject: [Buildroot] [PATCH] package/cracklib: properly handle
 BR2_SYSTEM_ENABLE_NLS=y configurations
In-Reply-To: <20190509204340.6606-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 9 May 2019 22:43:40 +0200")
References: <20190509204340.6606-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h89hmvf4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Use the TARGET_NLS_DEPENDENCIES and TARGET_NLS_LIBS variables to
 > correctly handle BR2_SYSTEM_ENABLE_NLS=y configurations.

 > Fixes:

 >   http://autobuild.buildroot.net/results/dda70b5b88c75d36c61fbf1cc5fca16ea8414582/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
