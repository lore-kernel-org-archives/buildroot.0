From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Mar 2017 13:45:27 +0000
Subject: [Buildroot] [Bug 9711] Recent libCEC version bump seems to break
	kodi package
In-Reply-To: <bug-9711-163@https.bugs.busybox.net/>
References: <bug-9711-163@https.bugs.busybox.net/>
Message-ID: <bug-9711-163-FHfJh3eRlP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9711

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #12 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We reverted libcec in commit
https://git.buildroot.org/buildroot/commit/package/libcec?id=9642d9589ce2c973340b391ddf0dd042b57025aa
to fix this issue. We will bump it again together with the Kodi 17 bump.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
