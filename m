From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Aug 2014 00:50:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/ngrep: fix static build
In-Reply-To: <1407599682-23233-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 9 Aug 2014 17:54:42 +0200")
References: <1407599682-23233-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87zjf5z7t4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Use pcap-config to list optional libpcap dependencies that we need to list
 > when building statically.

 > Inspired by Baruch Siach
 > http://git.buildroot.net/buildroot/commit/package/dhcpdump/dhcpdump.mk?id=429f4415cd153c6809394a8b3245d4d15bba3ec3

 > Fixes
 > http://autobuild.buildroot.net/results/3c5/3c584b850cabebcf93dfd61c59e28988165a41c4/
 > http://autobuild.buildroot.net/results/938/93842b54767cca51c68ad33ddc93ec58d70602c8/
 > http://autobuild.buildroot.net/results/0ae/0ae4adec7fe66f819c7b3dabf13648fb29247de6/
 > http://autobuild.buildroot.net/results/9c2/9c203bc6ca91da68c9e7335611c1fb56224380bc/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
