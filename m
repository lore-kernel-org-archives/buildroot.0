From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 20 Jan 2013 21:03:06 +0100
Subject: [Buildroot] [PATCH] httping: remove redundant 'override CFLAGS'
	patch
In-Reply-To: <1358603554-6869-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 19 Jan 2013 14:52:33 +0100")
References: <87ehhnudd9.fsf@dell.be.48ers.dk>
 <1358603554-6869-1-git-send-email-arnout@mind.be>
Message-ID: <87zk03d3lx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> It is not necessary to override CFLAGS when CFLAGS is passed through
 Arnout> the environment rather than as an argument to make.

Committed, thanks.

-- 
Bye, Peter Korsgaard
