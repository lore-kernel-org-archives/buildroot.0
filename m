From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 May 2014 08:45:04 +0200
Subject: [Buildroot] [PATCH] czmq: needs MMU
In-Reply-To: <97ed4f06546e84c2b326a01447f77519460dfeff.1399262283.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 5 May 2014 06:58:03 +0300")
References: <97ed4f06546e84c2b326a01447f77519460dfeff.1399262283.git.baruch@tkos.co.il>
Message-ID: <87k3a0iv0v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/6dd/6dd6954e5ab8c422070e53b0e616e1b1a821c626/

 > Also, remove the Blackfin toolchain dependencies as these are redundant now
 > since Blackfin is a noMMU arch.

You forgot its reverse dependencies (filemq). Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
