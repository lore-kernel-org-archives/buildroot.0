From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 09 Jul 2017 12:44:49 +0000
Subject: [Buildroot] [Bug 10011] wget does not work from Buildroot
In-Reply-To: <bug-10011-163@https.bugs.busybox.net/>
References: <bug-10011-163@https.bugs.busybox.net/>
Message-ID: <bug-10011-163-FBEV8iUEs0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10011

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Buildroot is not responsible for this problem: it uses the wget available from
your system, and relies on a working network connectivity. Here the "Temporary
failure in name resolution" seems to indicate your DNS was not working.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
