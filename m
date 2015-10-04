From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2015 20:21:53 +0200
Subject: [Buildroot] [PATCH] gcc: sort the patches before they are hashed
In-Reply-To: <1443979563-22905-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 4 Oct 2015 18:26:03 +0100")
References: <1443979563-22905-1-git-send-email-arnout@mind.be>
Message-ID: <87si5qijem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > $(wildcard ...) in make doesn't sort the files, so the order of the
 > hashed files is not predictable. Therefore, the ccache hash could
 > change from one build to another. We don't want that, so sort the
 > files explicitly.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
