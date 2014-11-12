From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Nov 2014 22:28:23 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141112222823.2E3FEAEEC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Outdated package            |Other

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-12 22:28:22 UTC ---
Problem reproduced.

One data point is that python3 has the problem, but not python2. Tested with
the same uClibc toolchain.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
