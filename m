From: Sven Neumann <s.neumann@phase-zero.de>
Date: Sun, 18 Jan 2009 14:11:52 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <87ljt827tb.fsf@macbook.be.48ers.dk>
References: <20090118105725.52A2177108@busybox.osuosl.org>
	<87ljt827tb.fsf@macbook.be.48ers.dk>
Message-ID: <1232284312.1493.5.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, 2009-01-18 at 12:05 +0100, Peter Korsgaard wrote:

> I would prefer to leave that hunk out for now - It makes the history
> easier to read if all 2.15 stuff is in the same commit.

Please do not include an unstable development build of GTK+ in
buildroot. No one would benefit from that. The latest stable release is
2.14.7. The 2.15.x releases are development snapshots. They may contain
API that is not yet final and they certainly have bugs.

Same holds true for GLib. Please use glib 2.18.4 and not a 2.19.x
development release.


Sven
