From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 May 2014 22:43:43 +0200
Subject: [Buildroot] [PATCH 1/1] cairo: fix build of any2ppm if no
	fork().
In-Reply-To: <1398418035-21257-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Fri, 25 Apr 2014 11:27:15 +0200")
References: <1398418035-21257-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <874n0qu60w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > The test program any2ppm can run as daemon. This feature can be disabled
 > at compile time, if the required headers are not present. However the
 > support for fork() is not checked.

 > Fixes http://autobuild.buildroot.net/results/4f2/4f271d55d7060d412aa336cfc2da3be3538d3594/.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
