From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Jun 2016 21:13:00 +0200
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.0
In-Reply-To: <1466643361-12866-1-git-send-email-gustavo.zacarias@free-electrons.com>
 (gustavo zacarias's message of "Wed, 22 Jun 2016 21:56:01 -0300")
References: <1466643361-12866-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <87a8ibvhvn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:

 > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
 > Fixes:

 > CVE-2016-4472 - Improve insufficient fix to CVE-2015-1283 /
 > CVE-2015-2716 introduced with Expat 2.1.1

 > CVE-2016-5300 - Use more entropy for hash initialization than the
 > original fix to CVE-2012-0876

 > CVE-2012-6702 - Resolve troublesome internal call to srand that was
 > introduced with Expat 2.1.0 when addressing CVE-2012-0876

 > Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
