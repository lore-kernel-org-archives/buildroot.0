From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:06:30 +0200
Subject: [Buildroot] [PATCH] package/dovecot: security bump to version
 2.3.5.2
In-Reply-To: <20190425102618.32491-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 25 Apr 2019 12:26:18 +0200")
References: <20190425102618.32491-1-peter@korsgaard.com>
Message-ID: <87mukcx6eh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > * CVE-2019-10691: Trying to login with 8bit username containing
 >   invalid UTF8 input causes auth process to crash if auth policy is
 >   enabled. This could be used rather easily to cause a DoS. Similar
 >   crash also happens during mail delivery when using invalid UTF8 in
 >   From or Subject header when OX push notification driver is used.

 > https://dovecot.org/pipermail/dovecot-news/2019-April/000406.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
