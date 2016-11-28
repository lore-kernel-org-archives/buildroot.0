From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Nov 2016 23:44:53 +0100
Subject: [Buildroot] [PATCH] gst1-plugins-bad: add upstream patch to fix
	security issue in vmnc decoder
In-Reply-To: <20161128215538.9863-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 28 Nov 2016 22:55:38 +0100")
References: <20161128215538.9863-1-peter@korsgaard.com>
Message-ID: <8737ibdy1m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > As detailed by Chris Evans, the vmnc decoder contains an integer overflow which
 > can be exploited:

 > https://scarybeastsecurity.blogspot.be/2016/11/0day-poc-risky-design-decisions-in.html

 > Fixes CVE-2016-9445 and CVE-2016-9446.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
