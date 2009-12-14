From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Dec 2009 20:16:32 +0000 (UTC)
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch and
 config option for readline/ncurses support
In-Reply-To: <bug-803-163@https.bugs.busybox.net/>
References: <bug-803-163@https.bugs.busybox.net/>
Message-ID: <20091214201632.1E292777F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gustavo at zacarias.com.ar




--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-12-14 20:16:31 UTC ---

You're probably missing a patch in your patch file since normally lua doesn't
build shared libs (a patch to lua's Makefile to be precise), maybe you forgot
to include it?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
