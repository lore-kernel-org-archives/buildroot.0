From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 21:21:39 +0000
Subject: [Buildroot] [Bug 10331] kmsxx,
 host installation fails with BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <bug-10331-163@https.bugs.busybox.net/>
References: <bug-10331-163@https.bugs.busybox.net/>
Message-ID: <bug-10331-163-39lIPO1AwC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10331

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report! Fixed by
https://git.buildroot.org/buildroot/commit/?id=28d5ca9c96f5144e86fac7ec6485fa5634cd6e97.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
