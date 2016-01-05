From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2016 11:51:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnpp: needs at least gcc 4.6
In-Reply-To: <1451984072-2312-1-git-send-email-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?= Krause"'s message of "Tue, 5 Jan 2016 09:54:32
 +0100")
References: <1451984072-2312-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <874mesi9jh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Version 0.13.1 of libupnpp uses range-based for loops. This C++11 feature
 > requires at least gcc 4.6.

 > Fixes:
 > http://autobuild.buildroot.net/results/aa9/aa93ff96305a3b201636bea65f1cfdb6db6d3dfb/
 > http://autobuild.buildroot.net/results/d8b/d8b96987a5336a64857817ec9831b0fb12867e7c/
 > http://autobuild.buildroot.net/results/408/40807fe84f67961817b6592a6df243c036cf3b4b/
 > http://autobuild.buildroot.net/results/408/40807fe84f67961817b6592a6df243c036cf3b4b/
 > .. and many more

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
