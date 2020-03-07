From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 21:53:47 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.3
In-Reply-To: <20200203112822.4250-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 3 Feb 2020 12:28:21 +0100")
References: <20200203112822.4250-1-peter@korsgaard.com>
Message-ID: <87o8t7x4x0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-7471: Potential SQL injection via StringAgg(delimiter)
 >   django.contrib.postgres.aggregates.StringAgg aggregation function was
 >   subject to SQL injection, using a suitably crafted delimiter.

 > For more details, see the advisory:
 > https://www.djangoproject.com/weblog/2020/feb/03/security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

For 2019.02.x and 2019.11.x I have instead bumped to 2.2.11, which
contains the same fixes as in 3.0.3 and 3.0.4.

-- 
Bye, Peter Korsgaard
