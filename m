From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jan 2018 08:30:29 +0100
Subject: [Buildroot] [PATCH v2 2/2] squid: add upstream post-3.5.27
 security patches
In-Reply-To: <20180122195417.358-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 22 Jan 2018 20:54:17 +0100")
References: <20180122195417.358-1-peter@korsgaard.com>
 <20180122195417.358-2-peter@korsgaard.com>
Message-ID: <87h8rdniay.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > SQUID-2018:1 Due to incorrect pointer handling Squid is vulnerable to denial
 > of service attack when processing ESI responses.

 > http://www.squid-cache.org/Advisories/SQUID-2018_1.txt

 > SQUID-2018:2  Due to incorrect pointer handling Squid is vulnerable to
 > denial of service attack when processing ESI responses or downloading
 > intermediate CA certificates.

 > http://www.squid-cache.org/Advisories/SQUID-2018_2.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
