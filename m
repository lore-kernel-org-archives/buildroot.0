From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Mar 2010 22:48:08 +0100
Subject: [Buildroot] mkfs.jffs2 can't find zlib.h
In-Reply-To: <20100226072621.16992lq3smxxymm8@www.home.zuerker.org> (Heiko
	Zuerker's message of "Fri, 26 Feb 2010 07:26:21 -0600")
References: <20100226072621.16992lq3smxxymm8@www.home.zuerker.org>
Message-ID: <873a0av61z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:

 Heiko> Hey guys,
 Heiko> mkfs.jffs2 fails to compile because it can't find zlib.h.
 Heiko> I'm using the latest GIT version of buildroot and an external toolchain.

Thanks, fixed in git (d5bf5f967009).

-- 
Bye, Peter Korsgaard
