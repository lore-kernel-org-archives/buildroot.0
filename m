From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 20 Sep 2011 21:43:46 +0200
Subject: [Buildroot] [git commit] busybox: add 1.19.x branch and cleanup
In-Reply-To: <878vpzjayv.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
 of "Thu, 08 Sep 2011 17:43:52 +0200")
References: <20110906195720.696858D447@busybox.osuosl.org>
 <1315469814.4333.2.camel@sven> <878vpzjayv.fsf@macbook.be.48ers.dk>
Message-ID: <878vpj3sp9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@sunsite.dk> writes:

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
 Sven> I've updated buildroot from git today and changed the config to use
 Sven> busybox 1.19.2. Now compilation fails with the following error:

 Sven> In file included from miscutils/ubi_tools.c:63:
 Sven> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:329: error: conflicting types for ?__packed?

 Peter> That's a problem with kernel-headers 3.0 rather than a busybox 1.19
 Peter> issue. I'm looking into fixing it with upstream.

Sorry, took longer than planned, but I've just pushed a fix for it.

For details, see the lkml discussion here:

https://lkml.org/lkml/2011/6/22/25

-- 
Bye, Peter Korsgaard
