From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Mar 2018 15:44:53 +0200
Subject: [Buildroot] [PATCH 2/2] tpm2-tools: fix compilation error due
 to uninitialized variable
In-Reply-To: <20180325035953.25906-3-casantos@datacom.ind.br> (Carlos Santos's
 message of "Sun, 25 Mar 2018 00:59:53 -0300")
References: <20180325035953.25906-1-casantos@datacom.ind.br>
 <20180325035953.25906-3-casantos@datacom.ind.br>
Message-ID: <87a7uwxoa2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > Backport a patch alreary submitted upstream, at
 >   https://github.com/tpm2-software/tpm2-tools/pull/954

 > Fixes:
 >   http://autobuild.buildroot.net/results/ae1e151576b365380ab711a1b8ffcd92ad0050e2
 >   http://autobuild.buildroot.net/results/ee80c2fe54c89589532efd47eb93bd27637c690f

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
