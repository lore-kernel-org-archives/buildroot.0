From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Aug 2019 13:16:32 +0000
Subject: [Buildroot] [Bug 12106] daq: build fails if libdumbnet-dev is
 installed in the host
In-Reply-To: <bug-12106-163@https.bugs.busybox.net/>
References: <bug-12106-163@https.bugs.busybox.net/>
Message-ID: <bug-12106-163-ZR679cv4sP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12106

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=bd8a37a681cb5190f5af0ed1c20f556bf5661345.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
