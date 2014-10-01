From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Oct 2014 15:57:35 +0200
Subject: [Buildroot] [PATCHv2] rsyslog: security bump to version 7.6.6
In-Reply-To: <1412169833-20581-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 1 Oct 2014 10:23:53 -0300")
References: <1412169833-20581-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878ukzoptc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-3634 - potential abort when a message with PRI > 191 was
 > processed if the "pri-text" property was used in active templates, this
 > could be abused to a remote denial of service from permitted senders.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
