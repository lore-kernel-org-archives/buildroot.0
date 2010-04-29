From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Apr 2010 21:08:25 +0000 (UTC)
Subject: [Buildroot] [Bug 803] [PATCH] lua - add shared library patch and
 config option for readline/ncurses support
In-Reply-To: <bug-803-163@https.bugs.busybox.net/>
References: <bug-803-163@https.bugs.busybox.net/>
Message-ID: <20100429210825.2797499955@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=803


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #857 is|0                           |1
           obsolete|                            |
         AssignedTo|unassigned at buildroot.uclibc.|gustavo at zacarias.com.ar
                   |org                         |
             Status|NEW                         |ASSIGNED




--- Comment #6 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2010-04-29 21:08:24 UTC ---
Created an attachment (id=1597)
 --> (https://bugs.busybox.net/attachment.cgi?id=1597)
Migrate lua to gentargets and improve it

Convert the lua package to gentargets.
It also enables new options to install selectively the lua interpreter,
compiler and shared library.
This allows us to build lua modules and packages for them in the future among
other things.
It defaults to build just the static liblua, users have to enable extra
functionality now (interpreter, compiler, shared liblua in target).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
