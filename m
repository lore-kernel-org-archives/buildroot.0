From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2020 18:08:27 +0000
Subject: [Buildroot] [Bug 12826] nodejs-12.16.1: error: 'uv_sleep' was not
 declared in this scope
In-Reply-To: <bug-12826-163@https.bugs.busybox.net/>
References: <bug-12826-163@https.bugs.busybox.net/>
Message-ID: <bug-12826-163-0YALB1ttTU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12826

--- Comment #2 from Aleksandr Makarov <seems.deviant@gmail.com> ---
Reverting the 7d9ed0a19d8e88b56b389187c38b44563e33e5ab does help to fix the
issue 
 so that nodejs 12.16.1 builds

-- 
You are receiving this mail because:
You are on the CC list for the bug.
