From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Aug 2010 10:52:27 +0000 (UTC)
Subject: [Buildroot] [Bug 2239] netcat package installs its binary to target
 as avr32-linux-netcat
In-Reply-To: <bug-2239-163@https.bugs.busybox.net/>
References: <bug-2239-163@https.bugs.busybox.net/>
Message-ID: <20100813105227.BE83E87456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2239

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Thanks Denys for forwarding the bug. Thanks Nick for the report.

The bug has been fixed in my for-2010.08, that will be pushed to Peter before
the 2010.08 release. See
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.08.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
