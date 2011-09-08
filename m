From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 08 Sep 2011 17:43:52 +0200
Subject: [Buildroot] [git commit] busybox: add 1.19.x branch and cleanup
In-Reply-To: <1315469814.4333.2.camel@sven> (Sven Neumann's message of "Thu,
 08 Sep 2011 10:16:50 +0200")
References: <20110906195720.696858D447@busybox.osuosl.org>
 <1315469814.4333.2.camel@sven>
Message-ID: <878vpzjayv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> I've updated buildroot from git today and changed the config to use
 Sven> busybox 1.19.2. Now compilation fails with the following error:

 Sven> In file included from miscutils/ubi_tools.c:63:
 Sven> /home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:329: error: conflicting types for ?__packed?

That's a problem with kernel-headers 3.0 rather than a busybox 1.19
issue. I'm looking into fixing it with upstream.

-- 
Bye, Peter Korsgaard
