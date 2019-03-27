From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 23:03:46 +0100
Subject: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.2.1
In-Reply-To: <20190323165427.29835-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 23 Mar 2019 17:54:27 +0100")
References: <20190323165427.29835-1-peter@korsgaard.com>
Message-ID: <87sgv8otz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > AST-2019-001: Remote crash vulnerability with SDP protocol violation
 > When Asterisk makes an outgoing call, a very specific SDP protocol violation
 > by the remote party can cause Asterisk to crash (CVE-2019-7251)

 > https://downloads.asterisk.org/pub/security/AST-2019-001.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
