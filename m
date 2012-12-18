From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 22:14:51 +0100
Subject: [Buildroot] [PATCH v2] python-bottle: new package
In-Reply-To: <87623zm5ht.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 18 Dec 2012 22:10:06 +0100")
References: <1355843684-10860-1-git-send-email-arnout@mind.be>
 <87623zm5ht.fsf@dell.be.48ers.dk>
Message-ID: <871uenm59w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Peter> Committed, thanks.

It btw didn't apply cleanly as you apparently based it on a tree with
local modifications from before python3 got added, but I fixed that
up. Please consider basing patches on a recent commit (or atleast a
commit from the public git so git am --3way gets a chance to figure it
out).

Thanks.


-- 
Bye, Peter Korsgaard
