From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Mar 2021 19:28:45 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-RaMlWlKWft@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

--- Comment #13 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Alfredo Pons Menargues from comment #12)

'NO UTF8' is again not very descriptive, a better/exact description would be
'I see only an square/replacement character' the default for an unknown
character in your selected/installed font (Liberation)...., the solution for
your problem
is to select/install an more complete font, e.g. DejaVu (BR2_PACKAGE_DEJAVU)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
