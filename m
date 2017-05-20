From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 May 2017 09:37:20 +0000
Subject: [Buildroot] [Bug 9886] Build fails with "unexpected EOF while
 looking for matching `"'" if PATH contains a newline
In-Reply-To: <bug-9886-163@https.bugs.busybox.net/>
References: <bug-9886-163@https.bugs.busybox.net/>
Message-ID: <bug-9886-163-7mMkTOjoaE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9886

--- Comment #2 from Ciro Santilli <ciro.santilli@gmail.com> ---
The patch worked for me, thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
