From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 01:19:15 +0100
Subject: [Buildroot] [PATCH v2] host-libxml2: enable debug for mesa3d
In-Reply-To: <1355224207-21745-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 11 Dec 2012 12:10:07 +0100")
References: <1355224207-21745-1-git-send-email-arnout@mind.be>
Message-ID: <87k3sig870.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> The API generation script in mesa3d requires libxml2 to be built with
 Arnout> debug, because it uses the lsCountNode function which is only available
 Arnout> in debug mode.

Committed, thanks.

-- 
Bye, Peter Korsgaard
