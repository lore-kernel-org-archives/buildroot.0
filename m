From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:59:43 +0200
Subject: [Buildroot] [PATCH] inadyn: not available for static
In-Reply-To: <1404996037-12695-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Jul 2014 09:40:37 -0300")
References: <1404996037-12695-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvi9ntsw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > inadyn isn't static-build friendly, even if we pull in the libz link
 > line for the failure stated below it'll fail when trying to link to
 > libdl and using dlopen for the plugins. Fixes:
 > http://autobuild.buildroot.net/results/1a1/1a1a184e8248e5c51fa730d0c9721fe67a9c84a4/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
