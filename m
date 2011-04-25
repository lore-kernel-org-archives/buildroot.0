From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Mon, 25 Apr 2011 13:24:00 -0600
Subject: [Buildroot] tic compile stops (resolved)
In-Reply-To: <1303751802.1283.12.camel@feynman.coloradoengineeringinc.com>
References: <1303749477.1283.5.camel@feynman.coloradoengineeringinc.com>
	<1303751802.1283.12.camel@feynman.coloradoengineeringinc.com>
Message-ID: <1303759440.1283.16.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-04-25 at 11:16 -0600, Michael J. Hammel wrote:
> FYI: Found something that is probably related but I need to investigate
> more.  The version of ncurses with 2010.11 is 5.7.
> This comes from
> http://invisible-island.net/ncurses/ncurses.faq.html#cross_compiles

Okay, even simpler than patching Buildroot - I just had to install a
newer version of ncurses to the host platform.  CentOS 5.4 has ncurses
5.5.  I downloaded and installed 5.7 from source and that fixed the
buildroot build.

Just following up in case someone else runs into this issue.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
