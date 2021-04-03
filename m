From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Apr 2021 12:21:29 +0200
Subject: [Buildroot] [PATCH] package/squid: security bump to version 4.14
In-Reply-To: <20210330061003.23351-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 Mar 2021 08:10:03 +0200")
References: <20210330061003.23351-1-peter@korsgaard.com>
Message-ID: <87y2dz653q.fsf@dell.be.48ers.dk>
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

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
