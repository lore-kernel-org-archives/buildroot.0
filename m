From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Nov 2015 09:24:56 +0100
Subject: [Buildroot] [PATCH] apply-patches.sh: use everything from the
	series file
In-Reply-To: <1446852432-30582-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 7 Nov 2015 00:27:12 +0100")
References: <1446852432-30582-1-git-send-email-arnout@mind.be>
Message-ID: <871tbpf2xz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > When a series file exists, we should use every file mentioned in it,
 > not just the ones ending with .patch or .diff. Also, there's no need
 > to uncompress anything if it's mentioned in a series file (the tools
 > that manipulate series files don't support compressed patches).

Committed, thanks.

-- 
Bye, Peter Korsgaard
