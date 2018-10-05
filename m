From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 13:27:39 +0200
Subject: [Buildroot] [PATCH] dtc: Fix segfault reading powernv device
 tree
In-Reply-To: <20180918035750.17651-1-joel@jms.id.au> (Joel Stanley's message
 of "Tue, 18 Sep 2018 13:27:50 +0930")
References: <20180918035750.17651-1-joel@jms.id.au>
Message-ID: <87h8i07hw4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > When running this command on a powernv machine, dtc crashes:
 >  dtc -f -I fs -O dts /sys/firmware/devicetree

 > Upstream has fixed the segfault but have not made a release yet so we
 > add the patch for now.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
