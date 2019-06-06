From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 14:20:47 +0200
Subject: [Buildroot] [PATCH] package/exim: add upstream security fix for
 CVE-2019-10149
In-Reply-To: <20190605162805.19966-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 5 Jun 2019 18:28:05 +0200")
References: <20190605162805.19966-1-peter@korsgaard.com>
Message-ID: <87d0jqnbvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > A flaw was found in Exim versions 4.87 to 4.91 (inclusive).  Improper
 > validation of recipient address in deliver_message() function in
 > src/deliver.c may lead to remote command execution.

 > For more details, see the advisory:

 > https://www.exim.org/static/doc/security/CVE-2019-10149.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
