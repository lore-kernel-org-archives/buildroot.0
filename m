From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Feb 2018 09:06:47 +0100
Subject: [Buildroot] [PATCH] exim: add upstream security fix
In-Reply-To: <20180219161435.20547-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 19 Feb 2018 17:14:35 +0100")
References: <20180219161435.20547-1-peter@korsgaard.com>
Message-ID: <871shggk4o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2018-6789: Meh Chang discovered a buffer overflow flaw in a utility
 > function used in the SMTP listener of Exim, a mail transport agent.  A
 > remote attacker can take advantage of this flaw to cause a denial of
 > service, or potentially the execution of arbitrary code via a specially
 > crafted message.

 > Dropped ChangeLog hunk and adjusted file path of upstream commit so it
 > applies to tarball.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
