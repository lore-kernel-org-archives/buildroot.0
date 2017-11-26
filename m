From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:24:44 +0100
Subject: [Buildroot] [PATCH] postgresql: security bump to version 9.6.6
In-Reply-To: <20171111104456.30603-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 11 Nov 2017 11:44:56 +0100")
References: <20171111104456.30603-1-peter@korsgaard.com>
Message-ID: <87zi78ens3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-12172: Start scripts permit database administrator to modify
 > root-owned files.

 > CVE-2017-15098: Memory disclosure in JSON functions.

 > CVE-2017-15099: INSERT ... ON CONFLICT DO UPDATE fails to enforce SELECT
 > privileges.

 > See the announcement for more details:
 > https://www.postgresql.org/about/news/1801/

 > While we're at it, also add a hash for the license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
