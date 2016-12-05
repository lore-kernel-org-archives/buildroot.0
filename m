From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 23:00:49 +0100
Subject: [Buildroot] Perl-related bug, #9291
In-Reply-To: <CAGhdn57yw=BXk7ZW2JLtf4OXYhR0Ziq5Z4u55uESdoFvrUMAvA@mail.gmail.com>
References: <20161015182827.5d030d2d@free-electrons.com>
 <CAGhdn57yw=BXk7ZW2JLtf4OXYhR0Ziq5Z4u55uESdoFvrUMAvA@mail.gmail.com>
Message-ID: <20161205230049.5f67d397@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Oct 2016 22:02:27 +0200, Fran?ois Perrad wrote:

> I fill a ticket https://github.com/arsv/perl-cross/issues/41

This issue has been fixed. Could you take care of doing the necessary
changes to the perl package?

It also looks like perl-cross has some more recent releases, like
1.1.1, but there are some significant changes. According to the 1.1.0
changelog:

 * Major code cleanup
 * Package name changed to perl-cross-N.M.tar.gz
 * Support for multiple perl versions

If you could have a look, it would be nice. If bumping to 1.1.1 for now
is too complicated, then a patch that at least backports the message
queues related fix would be good to have.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
