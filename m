From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Sep 2014 22:10:10 +0200
Subject: [Buildroot] [PATCH] memtester: fix rebuild
In-Reply-To: <5c88a09e632de7ceb60d70831ea1e1ec2604dc34.1410896220.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 16 Sep 2014 22:37:00 +0300")
References: <5c88a09e632de7ceb60d70831ea1e1ec2604dc34.1410896220.git.baruch@tkos.co.il>
Message-ID: <87oauf8gyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Do the edit of conf-* files only when 'cc' appears at the beginning of line,
 > i.e. the files has not been edited. Otherwise, the 'cc' part of the cross
 > toolchain gets expanded, leading to the following error on 'make
 > memtester-rebuild':

 > ./compile: line 3: /home/baruch/git/buildroot/output/host/usr/bin/i686-pc-linux-gnu-g/home/baruch/git/buildroot/output/host/usr/bin/i686-pc-linux-gnu-gcc: No such file or directory
 > Makefile:82: recipe for target 'memtester.o' failed
 > make[1]: *** [memtester.o] Error 127

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
