From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 22:23:11 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 2.2.8
In-Reply-To: <20191202122354.1700-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 2 Dec 2019 13:23:54 +0100")
References: <20191202122354.1700-1-peter@korsgaard.com>
Message-ID: <87sgm2qv5s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-19118: Privilege escalation in the Django admin

 > Additionally, 2.2.8 (and 2.2.7) fixes a number of bugs and adds python 3.8
 > support.

 > For more details, see the release notes:
 > https://docs.djangoproject.com/en/dev/releases/2.2.8/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
