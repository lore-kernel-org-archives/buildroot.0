From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 22:29:14 +0100
Subject: [Buildroot] [PATCH] libcurl: security bump to 7.52.1
In-Reply-To: <20161223101605.27718-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 23 Dec 2016 11:16:05 +0100")
References: <20161223101605.27718-1-peter@korsgaard.com>
Message-ID: <87inqafi6t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2016-9594 - Unitilized random
 > Libcurl's (new) internal function that returns a good 32bit random value was
 > implemented poorly and overwrote the pointer instead of writing the value
 > into the buffer the pointer pointed to.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
