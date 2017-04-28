From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:23:35 +0200
Subject: [Buildroot] [PATCH] minicom: security bump to version 2.7.1
In-Reply-To: <20170425114434.1728-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 25 Apr 2017 13:44:34 +0200")
References: <20170425114434.1728-1-peter@korsgaard.com>
Message-ID: <87fugsiuuw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-7467 - minicom and prl-vzvncserver vt100.c escparms[] buffer
 > overflow.

 > For more details about the issue, see the nice writeup on oss-security:

 > http://www.openwall.com/lists/oss-security/2017/04/18/5

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
