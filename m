From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jul 2010 14:44:38 +0000 (UTC)
Subject: [Buildroot] [Bug 1231] (sparc) Linux kernel fails to build
In-Reply-To: <bug-1231-163@https.bugs.busybox.net/>
References: <bug-1231-163@https.bugs.busybox.net/>
Message-ID: <20100726144438.7363C82928@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1231

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
As Sparc isn't really what we could call a CPU architecture widely used in
embedded systems, the core Buildroot team is not really willing to spend time
fixing Sparc related issues (we already have tons of other issues on more
important embedded architectures like ARM, PowerPC, MIPS, AVR32 and others).
So, unless someone (you ?) steps in with a fix for this, we are not going to
fix it.

We will probably mark the sparc and sparc64 architectures as deprecated in
Buildroot some day.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
