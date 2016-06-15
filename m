From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Jun 2016 12:50:50 +0000
Subject: [Buildroot] [Bug 9001] Nodejs option not available
In-Reply-To: <bug-9001-163@https.bugs.busybox.net/>
References: <bug-9001-163@https.bugs.busybox.net/>
Message-ID: <bug-9001-163-H750AIMTD3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9001

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Removing the dependency is wrong. This problem has been fixed in commit
3d2175780d70a864836c75343fd969fba1109057, which wasn't part of Buildroot
2016.05.

Basically, using Buildroot 2016.05 on a machine that has gcc 6 is not
supported. Use the latest Git if you are in such a situation.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
