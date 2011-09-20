From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:17:05 +0200
Subject: [Buildroot] [PATCH 1/5] package: add a PRE_PATCH_HOOKS hook
	point
In-Reply-To: <f804a151f0c35fbc3ce7b02be95203a253a15913.1316463052.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:10:52 +0200")
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
 <f804a151f0c35fbc3ce7b02be95203a253a15913.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874o073r5q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This will be useful to integrate Xenomai and RTAI into Buildroot, so
 Thomas> that they can patch the kernel before the normal patching process
 Thomas> starts.

They could presumably use the post-extract hook, but ok - committed,
thanks.

-- 
Bye, Peter Korsgaard
