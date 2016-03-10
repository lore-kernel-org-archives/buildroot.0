From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:33:36 +0100
Subject: [Buildroot] [PATCH 1/2] python-crossbar: propagate missing
	dependencies
In-Reply-To: <1457641016-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 10 Mar 2016 21:16:55 +0100")
References: <1457641016-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bn6mkogf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > python-crossbar selects python-msgpack which selects msgpack, which
 > depends on C++ and 4-byte __sync intrinsics. But python-crossbar does
 > not have the dependencies propagated.

 > Fixes:

 >   http://autobuild.buildroot.org/results/80f58b7264139dd82c690cb8aae97349aa412539/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
