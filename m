From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 May 2021 10:14:22 +0000
Subject: [Buildroot] [Bug 13801] toolchainfile.cmake CMAKE_BUILD_TYPE
In-Reply-To: <bug-13801-163@https.bugs.busybox.net/>
References: <bug-13801-163@https.bugs.busybox.net/>
Message-ID: <bug-13801-163-SZcHI47849@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13801

christian.morales.vega at gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
            Summary|toolchainfile.cmake         |toolchainfile.cmake
                   |hardcodes CMAKE_BUILD_TYPE  |CMAKE_BUILD_TYPE
             Status|NEW                         |RESOLVED

--- Comment #1 from christian.morales.vega at gmail.com ---
I was actually looking at a file doing something differently than what at least
the latest Buildroot does. Since it's set as a non-forced cache variable the
user's given value has priority.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
