From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 20:04:29 +0200
Subject: [Buildroot] [PATCH 03/13] binutils: remove deprecated 2.24.X
In-Reply-To: <20161015145107.18264-4-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 15 Oct 2016 16:50:57 +0200")
References: <20161015145107.18264-1-arnout@mind.be>
 <20161015145107.18264-4-arnout@mind.be>
Message-ID: <87vawt8p5e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > We will remove BR2_DEPRECATED, so remove this deprecated option.
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

There was still a select BR2_BINUTILS_VERSION_2_24_X in
Config.in.legacy, so I've changed that to select 2.25.x instead.

Committed after fixing that and removing the now unused binutils
patches, thanks.

-- 
Bye, Peter Korsgaard
