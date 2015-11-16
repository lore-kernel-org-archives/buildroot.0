From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 00:16:53 +0100
Subject: [Buildroot] [PATCH 1/2] gcc: add patches for powerpc e6500
	64-bit support
In-Reply-To: <1446818745-32224-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 6 Nov 2015 15:05:44 +0100")
References: <1446818745-32224-1-git-send-email-arnout@mind.be>
Message-ID: <87y4dxfsbe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Building with -mtune=e6500 led to build failures in glibc (probably in
 > uclibc as well) because gcc was built for a 32-bit target even though
 > the target tuple is powerpc64-*. This lead to a mix of 32-bit and
 > 64-bit support and build errors like:

 >   fatal error: gnu/lib-names-32.h: No such file or directory

 > The root cause is that the configure script is not handling e6500
 > correctly, because of stupid typo in the condition.

 > Change has been submitted upstream.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
