From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 20 Jul 2013 00:07:09 +0200
Subject: [Buildroot] [PATCHv2 1/3] gcc/arm: disable mudflap for thumb(1)
In-Reply-To: <1374239193-23811-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 19 Jul 2013 10:06:31 -0300")
References: <buildroot@busybox.net>
 <1374239193-23811-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ppuetd9u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> libmudflap doesn't build for a thumb(1) toolchain so disable it.
 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed series, thanks.

-- 
Bye, Peter Korsgaard
