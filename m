From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 15:04:38 +0200
Subject: [Buildroot] [PATCH] package/python: add upstream security fix
 for CVE-2019-9740
In-Reply-To: <20190828084932.7175-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 28 Aug 2019 10:49:32 +0200")
References: <20190828084932.7175-1-peter@korsgaard.com>
Message-ID: <87sgplo2zd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > An issue was discovered in urllib2 in Python 2.x through 2.7.16 and urllib
 > in Python 3.x through 3.7.3.  CRLF injection is possible if the attacker
 > controls a url parameter, as demonstrated by the first argument to
 > urllib.request.urlopen with \r\n (specifically in the query string after a ?
 > character) followed by an HTTP header or a Redis command.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
