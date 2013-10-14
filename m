From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 22:49:44 +0200
Subject: [Buildroot] [PATCH 3/3] boost: fix build failures after version
	bump
In-Reply-To: <1381760111-1271-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 14 Oct 2013 11:15:11 -0300")
References: <1381760111-1271-1-git-send-email-gustavo@zacarias.com.ar>
 <1381760111-1271-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761szo9w7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix build failures that happened after the version bump such as:
 Gustavo> http://autobuild.buildroot.net/results/570/570b091702763b29843d9207bc14dea67085fea0/
 Gustavo> http://autobuild.buildroot.net/results/c26/c26498f1a4e6bcbc3a2dfce6a51fa7d21b72f21f/
 Gustavo> and other failures by disabling the new (1.54+) coroutine and log
 Gustavo> libraries which weren't handled and hence enabled by default.

 Gustavo> These also made the target size bigger and build times longer
 Gustavo> unnecessarily.

 Gustavo> When/if they are needed for some future user this can be revisited and
 Gustavo> their proper conditions for enablement assesed.

Committed, thanks.

-- 
Bye, Peter Korsgaard
