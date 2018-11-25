From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Nov 2018 22:03:10 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.5
In-Reply-To: <20181107143812.19611-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 7 Nov 2018 15:38:12 +0100")
References: <20181107143812.19611-1-peter@korsgaard.com>
Message-ID: <87efb850q9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2018-5738: Some versions of BIND can improperly permit recursive query
 >   service to unauthorized clients

 > - CVE-2018-5740: A flaw in the "deny-answer-aliases" feature can cause an
 >   INSIST assertion failure in named

 > For more details, see the release notes:

 > https://ftp.isc.org/isc/bind9/9.11.5/RELEASE-NOTES-bind-9.11.5.html

 > Drop patch 0003-Rename-ptrsize-to-ptr_size.patch as the uClibc-ng issue was
 > fixed upstream in commit 931fd627f6195 (mips: fix clashing symbols), which
 > is included in uclibc-1.0.12 (January 2016).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
