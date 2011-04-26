From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 21:33:45 +0200
Subject: [Buildroot] [PATCHv2] u-boot 2011.03: fix build failure of just
	tools
In-Reply-To: <1303844512-16424-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 26 Apr 2011 16:01:52 -0300")
References: <1303844512-16424-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oc3s3izq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> When we build just u-boot for the tools, for instance for an uImage
 Gustavo> target and no u-boot image itself we just build the tools.
 Gustavo> When this happens we have an unconfigured u-boot target thus lacking a
 Gustavo> config.h and the build breaks.
 Gustavo> The config.h file isn't really needed for the tools so fix it.

Committed, thanks.

-- 
Bye, Peter Korsgaard
