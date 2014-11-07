From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2014 14:33:19 +0100
Subject: [Buildroot] [PATCHv2] grep: fix build failure for musl
In-Reply-To: <1415365017-14860-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Nov 2014 09:56:57 -0300")
References: <1415365017-14860-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mubw2xs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > musl doesn't implement re_match and friends and grep fails to
 > detect this properly, so force internal regex routines for musl.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
