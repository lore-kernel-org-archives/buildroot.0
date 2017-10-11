From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 11:29:52 +0000
Subject: [Buildroot] [Bug 10391] WiringPi retrieves wrong (old) version
In-Reply-To: <bug-10391-163@https.bugs.busybox.net/>
References: <bug-10391-163@https.bugs.busybox.net/>
Message-ID: <bug-10391-163-BkFp4qVU70@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

--- Comment #3 from srg.venema at gmail.com ---
Have a closer look at:

warning: Remote branch 2.44 not found in upstream origin, using HEAD instead
Could not fetch special ref '2.44'; assuming it is not special.

It goes ahead to download 2.42 instead.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
