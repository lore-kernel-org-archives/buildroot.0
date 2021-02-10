From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:57:36 +0100
Subject: [Buildroot] [PATCH] package/connman: add upstream security
 fixes for CVE-2021-2667{5, 6}
In-Reply-To: <20210208093921.3216-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Feb 2021 10:39:21 +0100")
References: <20210208093921.3216-1-peter@korsgaard.com>
Message-ID: <87k0rfk85r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-26675: Remote (adjacent network) code execution flaw
 > - CVE-2021-26676: Remote stack information leak

 > For details, see the advisory:
 > https://www.openwall.com/lists/oss-security/2021/02/08/2

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
