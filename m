From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:19:13 +0200
Subject: [Buildroot] [PATCH 1/2] musl: add more kernel headers guards
In-Reply-To: <00926ed70cd14972bac0ce653b1f383b4a31492c.1518524870.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 13 Feb 2018 14:27:49 +0200")
References: <00926ed70cd14972bac0ce653b1f383b4a31492c.1518524870.git.baruch@tkos.co.il>
Message-ID: <878ta95q32.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Kernel version 4.15 (not 4.16 as the musl commit log claims) allows
 > disabling of more parts of the kernel headers definitions. Add upstream
 > musl patch that defines the relevant macros. This solves issues of
 > networking related symbols redefinition in kernel headers that cause
 > headers conflicts. With that in place a subsequent commit will limit the
 > musl/kernel headers conflict avoidance workaround in Buildroot to kernel
 > headers older than 4.15. This workaround has been introduced in commit
 > 196932cd91 (toolchain: workaround musl/kernel headers conflict).

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
