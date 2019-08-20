From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 15:56:44 +0200
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.4.1
In-Reply-To: <20190728212832.2472-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 28 Jul 2019 23:28:31 +0200")
References: <20190728212832.2472-1-peter@korsgaard.com>
Message-ID: <87sgpw7xer.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2019-12827: A specially crafted SIP in-dialog MESSAGE message can cause
 > Asterisk to crash:

 > https://downloads.asterisk.org/pub/security/AST-2019-002.html

 > CVE-2019-13161: When T.38 faxing is done in Asterisk a T.38 reinvite may be
 > sent to an endpoint to switch it to T.38.  If the endpoint responds with an
 > improperly formatted SDP answer including both a T.38 UDPTL stream and an
 > audio or video stream containing only codecs not allowed on the SIP peer or
 > user a crash will occur.  The code incorrectly assumes that there will be at
 > least one common codec when T.38 is also in the SDP answer:

 > https://downloads.asterisk.org/pub/security/AST-2019-003.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
