From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 May 2014 21:04:27 +0200
Subject: [Buildroot] [PATCH] protobuf: limit to supported architectures
In-Reply-To: <1399752570-17218-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 10 May 2014 22:09:30 +0200")
References: <1399752570-17218-1-git-send-email-arnout@mind.be>
Message-ID: <87k39s87d0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > protobuf 2.5.0 adds an atomic operations implementation that is limited
 > to a few architectures only. mips64el and armeb don't work either.

 > Fixes (among others)
 > http://autobuild.buildroot.net/results/ae9fa612d0b6c9d593504206d5cedd480ad2547e/

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I think this is safer than Baruch's version for 2014.05 - Committed, thanks.

-- 
Bye, Peter Korsgaard
