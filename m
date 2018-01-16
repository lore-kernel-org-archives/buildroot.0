From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 20:37:02 +0100
Subject: [Buildroot] [PATCH] asterisk: security bump to version 14.7.5
In-Reply-To: <20180108100815.16770-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 8 Jan 2018 11:08:15 +0100")
References: <20180108100815.16770-1-peter@korsgaard.com>
Message-ID: <87vag1fvdt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > * AST-2017-014: Crash in PJSIP resource when missing a contact header A
 >   select set of SIP messages create a dialog in Asterisk.  Those SIP
 >   messages must contain a contact header.  For those messages, if the header
 >   was not present and using the PJSIP channel driver, it would cause
 >   Asterisk to crash.  The severity of this vulnerability is somewhat
 >   mitigated if authentication is enabled.  If authentication is enabled a
 >   user would have to first be authorized before reaching the crash point.

 > For more details, see the announcement:
 > https://www.asterisk.org/downloads/asterisk-news/asterisk-13185-1475-1515-and-1318-cert2-now-available-security

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.11.x, thanks.

-- 
Bye, Peter Korsgaard
