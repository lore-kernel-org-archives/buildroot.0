From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 22:08:20 +0000
Subject: [Buildroot] [Bug 10211] mkpasswd.c:183: pointless test ?
In-Reply-To: <bug-10211-163@https.bugs.busybox.net/>
References: <bug-10211-163@https.bugs.busybox.net/>
Message-ID: <bug-10211-163-Qtm8MFJM3u@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10211

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This code comes from the whois project at
https://github.com/rfc1036/whois/blob/next/mkpasswd.c. If there are any issues,
please report them to the upstream project. We can then backport the fix, or
upgrade to a newer version.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
