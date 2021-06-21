From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:02:55 +0200
Subject: [Buildroot] [git commit] package/gdb: improve gdb version
 choice comment
In-Reply-To: <20210613094506.45A518B876@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Sun, 13 Jun 2021 12:15:47 +0200")
References: <20210613094506.45A518B876@busybox.osuosl.org>
Message-ID: <87sg1b9h28.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=4de251ea41d109601ce84317b477a83f52629c15
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The comment has been introduced by commit [1] where the latest
 > gdb version has been used when cross-gdb is not enabled.

 > But since then the gdb package doesn't use the latest gdb version when
 > cross-gdb is not enabled. It's the "stable" version.

 > [1] https://git.buildroot.net/buildroot/commit/?id=fda818390b5e6a585608f4523356eafa0c587f53

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
