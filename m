From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 00:25:54 +0200
Subject: [Buildroot] [PATCH] openpowerlink: add patch to fix musl build
In-Reply-To: <20180825214607.20387-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 25 Aug 2018 23:46:07 +0200")
References: <20180825214607.20387-1-thomas.petazzoni@bootlin.com>
Message-ID: <87va7wahot.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > This commit adds a one-liner patch that fixes the build with musl of
 > the openpowerlink package, caused by a missing <sys/types.h>
 > include. The patch has been submitted upstream.

 > Fixes:

 >   http://autobuild.buildroot.net/results/8aff5f6d7bcab616129368c1fb22026bb164e454/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
