From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Feb 2011 20:02:34 +0000 (UTC)
Subject: [Buildroot] [Bug 267] The make target: cross fails because
 toolchain_build_<arch>/bin/sed not found
In-Reply-To: <bug-267-163@https.bugs.busybox.net/>
References: <bug-267-163@https.bugs.busybox.net/>
Message-ID: <20110202200234.5C3708F308@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=267

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
We don't build our own sed or symlink the host sed anymore, so this bug no
longer exists.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
