From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Jun 2013 20:33:04 +0200
Subject: [Buildroot] [PATCH] libpcap: fix build failure related to libnl3
In-Reply-To: <1370771136-1443-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Jun 2013 11:45:36 +0200")
References: <1370771136-1443-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gi3b0db.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When libpcap detects that libnl3 is available, it hardcodes the fact
 Thomas> of using -I/usr/include/libnl3, which is completely wrong in
 Thomas> cross-compilation.

 Thomas> This commit fixes that, by removing this hardcoded include path, and
 Thomas> by passing an appropriate -I option from libpcap.mk.

 Thomas> The original issue has been reported upstream at
 Thomas> https://github.com/the-tcpdump-group/libpcap/issues/305.

Committed, thanks.

-- 
Bye, Peter Korsgaard
