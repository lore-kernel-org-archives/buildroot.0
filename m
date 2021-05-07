From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 07 May 2021 13:07:10 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-HyhKSImgsr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

Alfredo Pons Menargues <alfredo.pons@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #14 from Alfredo Pons Menargues <alfredo.pons@gmail.com> ---
Correct,
The solution for the problem
is to select/install an more complete font, e.g. DejaVu (BR2_PACKAGE_DEJAVU).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
