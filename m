From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Dec 2015 21:27:41 +0100
Subject: [Buildroot] [PATCH] fakeroot: disable capabilities
In-Reply-To: <1449241894-8016-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 Dec 2015 12:11:34 -0300")
References: <1449241894-8016-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lh9a9cxu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > These don't autodetect consistently and are process rather than file
 > capabilities, so not very useful in the buildroot context.
 > Otherwise we'd have to unconditionally pull host-libcap (or fix the
 > detection, but again, not useful so there's no need).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
