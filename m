From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:47:03 +0200
Subject: [Buildroot] [PATCH 1/3] package/docker-engine: security bump to
 version 18.09.7
In-Reply-To: <20190920060959.28210-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 20 Sep 2019 08:09:56 +0200")
References: <20190920060959.28210-1-peter@korsgaard.com>
Message-ID: <87h84t5220.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > CVE-2019-13509: Docker Engine in debug mode may sometimes add secrets to the
 > debug log.  This applies to a scenario where docker stack deploy is run to
 > redeploy a stack that includes (non external) secrets.  It potentially
 > applies to other API users of the stack API if they resend the secret.

 > And a number of other non-security issues.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
