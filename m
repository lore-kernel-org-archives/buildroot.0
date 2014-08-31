From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 31 Aug 2014 22:26:08 +0200
Subject: [Buildroot] [PATCH v2 1/9] package/cmake: add host-pkgconf as
	dependency
In-Reply-To: <1409514922-9509-2-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sun, 31 Aug 2014 21:55:14 +0200")
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
 <1409514922-9509-2-git-send-email-s.martin49@gmail.com>
Message-ID: <87vbp8mmn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > Since some CMake modules (even upstream ones) use pgk_check_modules
 > primtives to find {C,LD}FLAGS, then add it to the dependency list.

Committed with the commit message fixed, thanks.

-- 
Bye, Peter Korsgaard
