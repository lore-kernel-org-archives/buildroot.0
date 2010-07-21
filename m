From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Jul 2010 13:26:35 +0000 (UTC)
Subject: [Buildroot] [Bug 2245] nc need to support -k (multiple listen) BSD
	extension
In-Reply-To: <bug-2245-163@https.bugs.busybox.net/>
References: <bug-2245-163@https.bugs.busybox.net/>
Message-ID: <20100721132635.B9E1082A6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2245

Denys Vlasenko <vda.linux@googlemail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Other                       |Other
            Version|2010.05                     |1.16.x
         AssignedTo|unassigned at buildroot.uclibc |unassigned at busybox.net
                   |.org                        |
            Product|buildroot                   |Busybox
            Summary|Netcat does not work due to |nc need to support -k
                   |incorrect assumptions about |(multiple listen) BSD
                   |signed chars.               |extension

--- Comment #6 from Denys Vlasenko <vda.linux@googlemail.com>  ---
Hijacking this bug for my own evil plans :D

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
