From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 15 Apr 2014 01:21:19 +0200
Subject: [Buildroot] Commit mtd: fix build against uClibc reverted.
Message-ID: <AE1A486A4CE04A45B8F2EDE23B563100@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Dear ;

Commit mtd: fix build against uClibc
Add a rpmatch() implementation when uClibc is missing one.

Fixes:
http://autobuild.buildroot.net/results/171/17187c3c9ba2b9df2bb6ac103e9a54706f07c28b/


Strange
I had to revert this commit in my build, it yielded the error in mtd it supposed to fix.

This patch seems to be intended for uClibc 0.9.34 but it seems to be applied on my 0.9.33.2

Regards
Sagaert Johan
