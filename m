From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jan 2017 16:15:34 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.0-P2
In-Reply-To: <20170112080000.27394-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 12 Jan 2017 09:00:00 +0100")
References: <20170112080000.27394-1-peter@korsgaard.com>
Message-ID: <87mvevat49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Bugfixes:
 >  - CVE-2016-9131: A malformed response to an ANY query can cause an
 >    assertion failure during recursion

 >  - CVE-2016-9147: An error handling a query response containing inconsistent
 >    DNSSEC information could cause an assertion failure

 >  - CVE-2016-9444: An unusually-formed DS record response could cause an
 >    assertion failure

 >  - CVE-2016-9778: An error handling certain queries using the
 >    nxdomain-redirect feature could cause a REQUIRE assertion failure in db.c

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
