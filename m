From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:34:19 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: create
 ca-certificates.crt reproducibly
In-Reply-To: <20181021133507.CEED68828B@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 21 Oct 2018 14:36:32 +0100")
References: <20181021133507.CEED68828B@busybox.osuosl.org>
Message-ID: <87tvlb8qwk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c61b49e5b5c83237c8895d8caf76a9c448c41241
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Sort the certificates into alphabetical order so the contents of
 > ca-certificates.crt can be built reproducibly.

 > Note: The certificates are sorted uppercase then lowercase filenames
 > so the contents of ca-certificates.crt matches the source debian package.

 > Signed-off-by: Martin Bark <martin@barkynet.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
