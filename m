From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 24 Mar 2018 11:38:09 +0100
Subject: [Buildroot] [PATCH] tpm2-tss: fix build with musl
In-Reply-To: <20180323170030.17416-1-casantos@datacom.ind.br> (Carlos Santos's
 message of "Fri, 23 Mar 2018 14:00:30 -0300")
References: <20180323170030.17416-1-casantos@datacom.ind.br>
Message-ID: <87370p3gj2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Add a missing <sys/select.h> inclusion, needed for the definition of the
 > fd_set type. This patch can't be sent upstream because the changed file
 > does not exist anymore on the master branch.

 > Fixes:
 >   http://autobuild.buildroot.net/results/09e8b3b85d7113d60e8967a2d41a6aea8f8197c0
 >   http://autobuild.buildroot.net/results/2e4c70f2f1239eb19235ae04a936a6492daf316d
 >   http://autobuild.buildroot.net/results/bbd68f52781da735e983b1260de5b804787374b1

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
