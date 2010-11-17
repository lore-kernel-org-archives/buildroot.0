From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Nov 2010 23:04:23 +0000 (UTC)
Subject: [Buildroot] [Bug 2479] host-module-init-tools 3.11 fails to build
In-Reply-To: <bug-2479-163@https.bugs.busybox.net/>
References: <bug-2479-163@https.bugs.busybox.net/>
Message-ID: <20101117230423.CE6F58E997@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2479

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This has been fixed by bumping module-init-tools 3.12. See
http://git.buildroot.net/buildroot/commit/?id=7be90dae8adc8d98b57dc4bc21630d8671523350

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
