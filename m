From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 16:39:17 +0200
Subject: [Buildroot] [PATCH] package/subversion: security bump to
 version 1.9.12
In-Reply-To: <20190731230251.7499-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 1 Aug 2019 01:02:50 +0200")
References: <20190731230251.7499-1-peter@korsgaard.com>
Message-ID: <87pnkz7vfu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-11782: Remotely triggerable DoS vulnerability in svnserve
 > 'get-deleted-rev'
 > https://subversion.apache.org/security/CVE-2018-11782-advisory.txt

 > CVE-2019-0203: Remote unauthenticated denial-of-service in Subversion
 > svnserve
 > https://subversion.apache.org/security/CVE-2019-0203-advisory.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
