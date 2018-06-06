From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 13:30:28 +0000
Subject: [Buildroot] [Bug 10751] Missing dependency in pulseaudio package
In-Reply-To: <bug-10751-163@https.bugs.busybox.net/>
References: <bug-10751-163@https.bugs.busybox.net/>
Message-ID: <bug-10751-163-EK4yBVkAD6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10751

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This has been fixed since then in Buildroot, see commit
https://git.buildroot.org/buildroot/commit/package/pulseaudio?id=5defa77123bb2f5bc63c0c44e1fa6ce516026de6.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
