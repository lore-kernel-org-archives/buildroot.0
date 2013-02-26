From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Feb 2013 17:22:10 +0100
Subject: [Buildroot] [PATCH] libfuse: not available for static builds
In-Reply-To: <1361873801-8672-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 26 Feb 2013 07:16:41 -0300")
References: <1361873801-8672-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874ngz82q5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Unfortunately libfuse uses dl functions exclusively so it can't be used
 Gustavo> for static builds so exclude it so.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/a1c3d2b9c436023675c363d9d3b365c95ade0329/

Huh, that build error is just because of the hardcoded target install
step (why don't we just use make install)?

Did you mean another build error?
-- 
Bye, Peter Korsgaard
