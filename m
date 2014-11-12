From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Nov 2014 08:59:30 +0100
Subject: [Buildroot] [PATCH 1/2] libmemcached: disable libmudflapth
	support
In-Reply-To: <1415749365-10946-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Nov 2014 20:42:44 -0300")
References: <1415749365-10946-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ioikluhp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > We're not handling it (copying it) for external toolchains and it's
 > causing build failures. Fixes:
 > http://autobuild.buildroot.net/results/9d1/9d1e414850307487d65435216ae0ddee56d1098f/
 > http://autobuild.buildroot.net/results/f08/f08c8e5514e054397428677f08fadac5386189dc/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
