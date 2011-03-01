From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Mar 2011 22:45:08 +0000 (UTC)
Subject: [Buildroot] [Bug 2845] dialog 1.1 needs libtinfo from ncurses
In-Reply-To: <bug-2845-163@https.bugs.busybox.net/>
References: <bug-2845-163@https.bugs.busybox.net/>
Message-ID: <20110301224508.615F88D3E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2845

S?rgio <sergio@sergiomb.no-ip.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #3049|Make optional build         |Make optional build ncurses
        description|nucruses                    |--with-termlib=tinfo
                   |--with-termlib=tinfo        |

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
