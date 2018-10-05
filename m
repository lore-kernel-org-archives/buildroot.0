From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 22:37:04 +0200
Subject: [Buildroot] [PATCH v2] gnupg: Package only needs ncurses with
 readline
In-Reply-To: <20181003002517.27064-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Wed, 3 Oct 2018 00:25:48 +0000")
References: <20181003002517.27064-1-tpiepho@impinj.com>
Message-ID: <87ftxkyvtb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > This package only needs ncurses when readline support is enabled, as it's the
 > autoconf macro file for readline (used by autoconf to create the gnupg configure
 > script) that checks for and pulls in ncurses.

 > Since readline already depends on ncurses, gnupg need only depend on
 > readline (when enabled).

 > The host package always forces readline support off, so the host-ncurses
 > dependency can be removed entirely.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
