From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 19:12:00 +0000
Subject: [Buildroot] [Bug 10121] webkit without the multimedia option causes
	build error
In-Reply-To: <bug-10121-163@https.bugs.busybox.net/>
References: <bug-10121-163@https.bugs.busybox.net/>
Message-ID: <bug-10121-163-cyuBW9M7OO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10121

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/package/webkitgtk?id=9aceb8bfa8c39167b1c449301b7f00f16e4f816c
and
https://git.buildroot.org/buildroot/commit/package/webkitgtk?id=f2b9399c769001d790e4a6ea199e1f36f181db8a.
Thanks Adri?n!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
