From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 20 Dec 2020 09:54:44 +0000
Subject: [Buildroot] [Bug 13396] Mirai Virus ?
In-Reply-To: <bug-13396-163@https.bugs.busybox.net/>
References: <bug-13396-163@https.bugs.busybox.net/>
Message-ID: <bug-13396-163-GUM8oIgFVN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13396

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |uclibc-cvs at uclibc.org,
                   |                            |yann.morin.1998 at free.fr
            Product|buildroot                   |uClibc
          Component|Other                       |Other
           Assignee|unassigned at buildroot.uclibc |unassigned at uclibc.org
                   |.org                        |
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
First, uClibc has had no activity since 2015. It's dead and has been replaced
with uClibc-ng: https://uclibc-ng.org/. As such, any bug should probably
reported there now.

Second, 2015 was before the disclosure of Mirai, and the ldconfig code had
anyway not been touched since 2011.

Third, you are referencing a toolchain that was built in April 2009, more than
11 years ago now, so at least seven years before Mirai was discovered. I would
wager that this definitely predates Mirai.

I would believe that this is a false positive.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
