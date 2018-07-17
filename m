From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:32:00 +0200
Subject: [Buildroot] [PATCH] redis: security bump to version 3.2.12
In-Reply-To: <20180613201643.9644-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 13 Jun 2018 22:16:43 +0200")
References: <20180613201643.9644-1-peter@korsgaard.com>
Message-ID: <87h8kyl3m7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the release notes:
 > ================================================================================
 > Redis 3.2.12     Released Wed Jun 13 12:43:01 CEST 2018
 > ================================================================================

 > Upgrade urgency CRITICAL:

 > * Multilple security issues fixed.
 > * Backport of an older AOF fsync=always fix. Check 4.x release notes.
 > * Backport of a *SCAN bug. Sometimes elements could be missing from the scan.
 > * Other minor things.

 > https://raw.githubusercontent.com/antirez/redis/3.2/00-RELEASENOTES

 > For more details about the lua related security issues, see the blog:

 > http://antirez.com/news/119

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
