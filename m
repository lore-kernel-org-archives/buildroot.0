From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 09:49:35 +0200
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.1
In-Reply-To: <20170618212004.32001-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 18 Jun 2017 23:20:04 +0200")
References: <20170618212004.32001-1-peter@korsgaard.com>
Message-ID: <87zicvi3xs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > - CVE-2017-9233 - External entity infinite loop DoS. See:
 >   https://libexpat.github.io/doc/cve-2017-9233/

 > - CVE-2016-9063 -- Detect integer overflow

 > And further more:

 > - Fix regression from fix to CVE-2016-0718 cutting off longer tag names.

 > - Extend fix for CVE-2016-5300 (use getrandom() if available).

 > - Extend fix for CVE-2012-0876 (Change hash algorithm to William Ahern's
 >   version of SipHash).

 > Also add an upstream patch to fix detection of getrandom().

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed this + fixup patch to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
