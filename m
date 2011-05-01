From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 May 2011 19:07:06 +0200
Subject: [Buildroot] mysql server and stack direction
In-Reply-To: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org> (Heiko
	Zuerker's message of "Sun, 01 May 2011 07:48:08 -0500")
References: <20110501074808.87796h8v1x8gb3k8@www.home.zuerker.org>
Message-ID: <87mxj6uz7p.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

 Heiko> Hi,
 Heiko> I'm working on the MySQL server package (v5.1 done, v5.5 will be
 Heiko> next), but one of the issues is that it needs the "stack direction"
 Heiko> set before the compile.

Out of interest, why two versions?

 Heiko> Does anybody have an idea how this can be configured dynamically? I'd
 Heiko> really hate to have to make this a config option.

Almost everything (perhaps all archs supported by BR?) have stacks
growing down, so I think hardcoding it in the .mk seems the
easiest/best.

-- 
Bye, Peter Korsgaard
