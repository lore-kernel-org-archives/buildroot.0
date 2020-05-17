From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 19:23:02 +0000
Subject: [Buildroot] [Bug 12691] host-rust build fails
In-Reply-To: <bug-12691-163@https.bugs.busybox.net/>
References: <bug-12691-163@https.bugs.busybox.net/>
Message-ID: <bug-12691-163-2p7MBfKzwa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12691

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Applied the patch proposed by Romain as
https://git.buildroot.org/buildroot/commit/?id=4c051c65eee278e54a95ec0f5790e39f9af901c9

-- 
You are receiving this mail because:
You are on the CC list for the bug.
