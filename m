From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Mar 2021 17:15:19 +0200
Subject: [Buildroot] [PATCH] package/squid: security bump to version 4.14
In-Reply-To: <20210330061003.23351-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 Mar 2021 08:10:03 +0200")
References: <20210330061003.23351-1-peter@korsgaard.com>
Message-ID: <87ft0cd660.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-25097: HTTP Request Smuggling

 >   Due to improper input validation Squid is vulnerable to an HTTP Request
 >   Smuggling attack.

 > For more details, see the advisory:
 > https://github.com/squid-cache/squid/security/advisories/GHSA-jvf6-h9gj-pmj6

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
