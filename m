From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Sep 2012 20:13:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5570] Cannot compile software on the target machine
In-Reply-To: <bug-5570-163@https.bugs.busybox.net/>
References: <bug-5570-163@https.bugs.busybox.net/>
Message-ID: <20120924201356.DDEE7996FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5570

--- Comment #4 from Maribu <mari.hahn@uni-muenster.de> 2012-09-24 20:13:56 UTC ---
Ok, with all paths referring to host machine in /usr/bin/libtool and
/usr/lib/*.la changed to corresponding counterparts in the target file system,
I can build static librarys. But ld seems to be broken. I'll try to rebuild
binutils so I get a working ld.

Regards,
Maribu

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
