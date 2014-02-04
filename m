From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 22:39:12 +0100
Subject: [Buildroot] [PATCH] libsigsegv: disable for xtensa
In-Reply-To: <cde857be269d16821c13a0714b7d5a922edc4940.1391539304.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 4 Feb 2014 20:41:44 +0200")
References: <cde857be269d16821c13a0714b7d5a922edc4940.1391539304.git.baruch@tkos.co.il>
Message-ID: <871tzi4kxr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The xtensa uClibc port does not provide the ucontext.h context manipulation
 > routines that libsigsegv needs.

 > Fixes:
 > http://autobuild.buildroot.net/results/06d/06d091f2ea8d08a900dd7304bab5eeeeb85f7353/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
