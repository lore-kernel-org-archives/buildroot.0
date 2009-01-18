From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jan 2009 14:48:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <1232284312.1493.5.camel@bender> (Sven Neumann's message of "Sun\,
	18 Jan 2009 14\:11\:52 +0100")
References: <20090118105725.52A2177108@busybox.osuosl.org>
	<87ljt827tb.fsf@macbook.be.48ers.dk> <1232284312.1493.5.camel@bender>
Message-ID: <87hc3w2092.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@phase-zero.de> writes:

 Sven> Hi,
 Sven> On Sun, 2009-01-18 at 12:05 +0100, Peter Korsgaard wrote:

 >> I would prefer to leave that hunk out for now - It makes the history
 >> easier to read if all 2.15 stuff is in the same commit.

 Sven> Please do not include an unstable development build of GTK+ in
 Sven> buildroot. No one would benefit from that. The latest stable release is
 Sven> 2.14.7. The 2.15.x releases are development snapshots. They may contain
 Sven> API that is not yet final and they certainly have bugs.

 Sven> Same holds true for GLib. Please use glib 2.18.4 and not a 2.19.x
 Sven> development release.

Agreed - Like I said in an earlier mail as well.

-- 
Bye, Peter Korsgaard
