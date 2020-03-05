From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Mar 2020 16:38:12 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to
 version 3.0.4
In-Reply-To: <20200304195452.23371-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 4 Mar 2020 20:54:52 +0100")
References: <20200304195452.23371-1-peter@korsgaard.com>
Message-ID: <87d09qbymz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2020-9402: Potential SQL injection via tolerance parameter in GIS
 >   functions and aggregates on Oracle.
 >   GIS functions and aggregates on Oracle were subject to SQL injection,
 >   using a suitably crafted tolerance.

 > For more details, see the advisory:
 > https://www.djangoproject.com/weblog/2020/mar/04/security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
