From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Nov 2014 23:25:26 +0100
Subject: [Buildroot] [PATCH] nftables: fix static build
In-Reply-To: <3e17fd6cd2d116233ebb766596c7d26254d9d698.1417031342.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 26 Nov 2014 21:49:02 +0200")
References: <3e17fd6cd2d116233ebb766596c7d26254d9d698.1417031342.git.baruch@tkos.co.il>
Message-ID: <87k32hppk9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > libnftnl needs -ljansson when built with json support.
 > Fixes:
 > http://autobuild.buildroot.net/results/68a/68ab2101a0b2b7d5482aafe0d88c87a50491159f/
 > http://autobuild.buildroot.net/results/87e/87ecbba5b9b16d592a48fe827fa88ef5a5c6d09b/

 > libnftl also needs -mxml when built with XML support.

 > Fixes:
 > http://autobuild.buildroot.net/results/58f/58f592d823db14e4e7558134f1b479f4f8659a23/
 > http://autobuild.buildroot.net/results/1cf/1cf23f2b38236f43971c65e704793b5bc762ecfe/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
