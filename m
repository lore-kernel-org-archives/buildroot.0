From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 26 Jan 2014 23:22:09 +0100
Subject: [Buildroot] [PATCH] poco: fix nios2 fenv build failure
In-Reply-To: <586913635fccc46b2eecfb9af23e6a8007f6d94f.1390679351.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sat, 25 Jan 2014 21:49:11 +0200")
References: <586913635fccc46b2eecfb9af23e6a8007f6d94f.1390679351.git.baruch@tkos.co.il>
Message-ID: <87r47uz8mm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Disable FP environment on nios2.
 > Fixes:
 > http://autobuild.buildroot.net/results/3ce/3ce9d6dc5c4e8fceebaa461e5085da7f33fda8a1/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
