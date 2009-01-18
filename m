From: Daniel Laird <danieljlaird@hotmail.com>
Date: Sun, 18 Jan 2009 13:43:38 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <1232284312.1493.5.camel@bender>
References: <20090118105725.52A2177108@busybox.osuosl.org>
	<87ljt827tb.fsf@macbook.be.48ers.dk> <1232284312.1493.5.camel@bender>
Message-ID: <COL102-W4349C4B9EE3EF1E762727FDCD20@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Also as i mentioned the other day, directfb GTK support is not very good at the moment in 2.14.x so if we are going to bounce versions we need to have Config.in support for specifying MAJOR,MINOR to allow us to stick with 2.12 series until 2.14 series is fixed and then in 2.16 etc.....Daniel Lairddanieljlaird at hotmail.com> From: s.neumann at phase-zero.de> To: jacmet at uclibc.org> Date: Sun, 18 Jan 2009 14:11:52 +0100> CC: buildroot at uclibc.org> Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/libgtk2> > Hi,> > On Sun, 2009-01-18 at 12:05 +0100, Peter Korsgaard wrote:> > > I would prefer to leave that hunk out for now - It makes the history> > easier to read if all 2.15 stuff is in the same commit.> > Please do not include an unstable development build of GTK+ in> buildroot. No one would benefit from that. The latest stable release is> 2.14.7. The 2.15.x releases are development snapshots. They may contain> API that is not yet final and they certainly have bugs.> > Same holds true for GLib. Please use glib 2.18.4 and not a 2.19.x> development release.> > > Sven> > > _______________________________________________> buildroot mailing list> buildroot at busybox.net> http://lists.busybox.net/mailman/listinfo/buildroot
_________________________________________________________________
Are you a PC?? Upload your PC story and show the world
http://clk.atdmt.com/UKM/go/122465942/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090118/a4a9ae41/attachment.htm 
