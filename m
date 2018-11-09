From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Nov 2018 15:57:49 +0100
Subject: [Buildroot] [PATCH] squid: security bump to version 4.4
In-Reply-To: <20181109135533.18802-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Nov 2018 14:55:32 +0100")
References: <20181109135533.18802-1-peter@korsgaard.com>
Message-ID: <87d0re70ya.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes SQUID-2018_4:
 > Due to incorrect input handling, Squid is vulnerable to a Cross-Site
 > Scripting vulnerability when generating HTTPS response messages about TLS
 > errors.

 > For more details, see the advisory:

 > http://www.squid-cache.org/Advisories/SQUID-2018_4.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
