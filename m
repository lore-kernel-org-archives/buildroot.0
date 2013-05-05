From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 21:09:33 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: fix build failure and install
	path
In-Reply-To: <1367766265-23301-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sun, 5 May 2013 12:04:25 -0300")
References: <1367766265-23301-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjw9nt02.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> aircrack-ng doesn't account that openssl needs zlib so fix it.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/97f4f90a7d60a0e3ea81c77f6986f1c1bae8d575/

 Gustavo> Also fix the install prefix since it was getting installed to
 Gustavo> /usr/local

Committed, thanks.

-- 
Bye, Peter Korsgaard
