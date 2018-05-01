From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 01 May 2018 13:17:29 +0000
Subject: [Buildroot] [Bug 5366] Login doesn't work with util-linux versions
 of login/agetty
In-Reply-To: <bug-5366-163@https.bugs.busybox.net/>
References: <bug-5366-163@https.bugs.busybox.net/>
Message-ID: <bug-5366-163-wjaCq0vrCw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5366

Dhananjay Patil <dhananjay.patil@lnttechservices.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|FIXED                       |---
             Status|RESOLVED                    |REOPENED
            Version|unspecified                 |2017.11
                 CC|                            |dhananjay.patil at lnttechserv
                   |                            |ices.com

--- Comment #14 from Dhananjay Patil <dhananjay.patil@lnttechservices.com> ---
I am facing same problem for buildroot 2017.11 
Both options BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS and
BR2_PACKAGE_UTIL_LINUX_AGETTY are disabled.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
