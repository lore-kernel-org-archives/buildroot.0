From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Dec 2012 12:26:40 +0100
Subject: [Buildroot] [PATCH] jpeg: fix make source
In-Reply-To: <1355743111-18183-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 17 Dec 2012 12:18:31 +0100")
References: <1355743111-18183-1-git-send-email-arnout@mind.be>
Message-ID: <87pq289axb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> 'make source' fails because the host-jpeg-source target doesn't exist
 Arnout> anymore. Fix this by adding this target explicitly.

Committed, thanks.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> ---

 Arnout> Note that this is only necessary because of the rather twisted
 Arnout> way that the top-level target and dependency lists are
 Arnout> generated. Now that all packages have been converted to
 Arnout> gentargets it would probably be possible to create all
 Arnout> necessary dependencies in the package-generic macro, which
 Arnout> would remove the need for this patch.

Agreed.

-- 
Bye, Peter Korsgaard
