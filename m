From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2021 09:16:21 +0100
Subject: [Buildroot] [PATCH-2020.11.x] package/glibc: security bump for
 additional post-2.31.x fixes
In-Reply-To: <20210110211825.7966-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 10 Jan 2021 22:18:25 +0100")
References: <20210110211825.7966-1-peter@korsgaard.com>
Message-ID: <87o8hvopm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-27618: An infinite loop has been fixed in the iconv program when
 > invoked with input containing redundant shift sequences in the IBM1364,
 > IBM1371, IBM1388, IBM1390, or IBM1399 character sets.

 > CVE-2020-29562: An assertion failure has been fixed in the iconv function
 > when invoked with UCS4 input containing an invalid character.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
