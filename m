From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 25 Mar 2017 13:46:31 +0000
Subject: [Buildroot] [Bug 9766] support/scripts/pkgutil.py conflicts with
 the pkgutil.py from setuptools => breaks scanpypi (2017.02)
In-Reply-To: <bug-9766-163@https.bugs.busybox.net/>
References: <bug-9766-163@https.bugs.busybox.net/>
Message-ID: <bug-9766-163-gD7HwtrB4p@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9766

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/support?id=3b627c89dc8adf8c60efd773935bf66004e8433d.
Thanks for reporting the bug!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
