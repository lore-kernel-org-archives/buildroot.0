From: David A. Bandel <david.bandel@gmail.com>
Date: Tue, 28 Oct 2008 22:14:15 -0500
Subject: [Buildroot] Bind compile problems
Message-ID: <ea6cc0c70810282014v2fdbe57ev542ad4cfe9c763b3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Folks,

Having a slight problem building bind-9.3.2 from svn:

/opt/buildroot/build_mips/bind-9.3.2/lib/isc/.libs/libisc.so:
undefined reference to `index'

This is during the linking stage.

Building mips32 if that makes a difference.

Entire chain builds without bind, only bind giving me problems.

Anyone seen this before?

TIA,

David A. Bandel
-- 
Focus on the dream, not the competition.
            - Nemesis Air Racing Team motto
