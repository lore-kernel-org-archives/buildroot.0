From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 18 Oct 2011 16:32:42 +0000 (UTC)
Subject: [Buildroot] timer_create fails with return -1 errno 0
Message-ID: <j7k9n9$cru$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can't figure out why timer_create() is failing.  It returns -1, but
errno is 0: "Success".

I'm using uClibc uClibc-0.9.30.3 (built by crosstool-NG) on an ARM926
buildroot system.

The same code ran fine using glibc on a desktop IA32 system.

-- 
Grant Edwards               grant.b.edwards        Yow! Now we can become
                                  at               alcoholics!
                              gmail.com            
