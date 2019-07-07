From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:31:17 +0200
Subject: [Buildroot] [PATCH] package/expat: security bump to version
 2.2.7
In-Reply-To: <20190628132613.8819-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 28 Jun 2019 15:26:13 +0200")
References: <20190628132613.8819-1-peter@korsgaard.com>
Message-ID: <87ef32cq4q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilites:
 > CVE-2018-20843: In libexpat in Expat before 2.2.7, XML input including XML
 > names that contain a large number of colons could make the XML parser
 > consume a high amount of RAM and CPU resources while processing (enough to
 > be usable for denial-of-service attacks).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
