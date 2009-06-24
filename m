From: jing han <jing_han_66@yahoo.com>
Date: Wed, 24 Jun 2009 07:40:28 -0700 (PDT)
Subject: [Buildroot] cannot find patches for mpfr package when buildroot
Message-ID: <693969.74850.qm@web53508.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi All,

I experienced a problem when I make MIPS64 environment. Even if I disabled mpfr package, When I make, I still encountered the following error:

--10:10:47--  http://www.mpfr.org/mpfr-2.4.1/mpfr-2.4.1.tar.bz2
Resolving www.mpfr.org... failed: Temporary failure in name resolution.
--10:11:07--  http://buildroot.net/downloads/sources//mpfr-2.4.1.tar.bz2
Resolving buildroot.net... 140.211.167.224
Connecting to buildroot.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1064281 (1.0M) [application/x-tar]
Saving to: `/home/jhan/Desktop/buildroot-2009.05/dl/mpfr-2.4.1.tar.bz2'

100%[====================================================================================>] 1,064,281    505K/s   in 2.1s

10:11:10 (505 KB/s) - `/home/jhan/Desktop/buildroot-2009.05/dl/mpfr-2.4.1.tar.bz2' saved [1064281/1064281]

--10:11:10--  http://www.mpfr.org/mpfr-2.4.1/patches
Resolving www.mpfr.org... failed: Temporary failure in name resolution.
--10:11:30--  http://buildroot.net/downloads/sources//patches
Resolving buildroot.net... 140.211.167.224
Connecting to buildroot.net|140.211.167.224|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
10:11:30 ERROR 404: Not Found.

make: *** [/home/jhan/Desktop/buildroot-2009.05/dl/mpfr-2.4.1.patch] Error 1


The reason is: http://buildroot.net/downloads/sources//patches doesn't exist. I did find 

mpfr-2.3.0.patch but it's not in the above link, it's located in the link of:http://buildroot.net/downloads/sources//

that's why the make broke.

This happens since this week.

Can you tell me how to get around this problem?

Thank you in advance!

Best Regards
jing


      __________________________________________________________________
Be smarter than spam. See how smart SpamGuard is at giving junk email the boot with the All-new Yahoo! Mail.  Click on Options in Mail and switch to New Mail today or register for free at http://mail.yahoo.ca
