From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jan 2013 00:10:13 +0100
Subject: [Buildroot] [PATCH v2] linux: fix appended dtb handling of
	pre/post v3.8-rc1
In-Reply-To: <1357680237-21101-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 8 Jan 2013 22:23:56 +0100")
References: <1357680237-21101-1-git-send-email-arnout@mind.be>
Message-ID: <87txqr9sq2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Also factor the common part out.

Committed, thanks. It wasn't clear exactly what you were fixing as the
commit message doesn't explain it and I hadn't seen Johan's mail, so I
extended it a bit.

Sorry, I missed this issue as I had already done a kernel build (which
generated the dtbs).

-- 
Bye, Peter Korsgaard
