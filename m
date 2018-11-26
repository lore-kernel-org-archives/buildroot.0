From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 09:32:00 +0100
Subject: [Buildroot] [PATCH-2018.02.x v2 1/3] squid: security bump to
 version 3.5.28
In-Reply-To: <20181125221323.16881-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 25 Nov 2018 23:13:21 +0100")
References: <20181125221323.16881-1-peter@korsgaard.com>
Message-ID: <87tvk4z1bz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes SQUID-2018:3 / CVE-2018-1172: Crash in ESI Response processing
 > For more details, see the advisory:

 > http://www.squid-cache.org/Advisories/SQUID-2018_3.txt

 > Drop patch 0003 / 0004 as these (security) fixes are now upstream.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed all 3 to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
