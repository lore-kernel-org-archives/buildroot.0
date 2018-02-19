From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 19 Feb 2018 22:50:18 +0000
Subject: [Buildroot] [Bug 10781] cryptsetup luksOpen container_file
 container causes libdevmapper segfault
In-Reply-To: <bug-10781-163@https.bugs.busybox.net/>
References: <bug-10781-163@https.bugs.busybox.net/>
Message-ID: <bug-10781-163-P0eVapRJqd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10781

--- Comment #1 from Nobodyman <jsmr@gmx.de> ---
(In reply to Nobodyman from comment #0)
Sorry, used command line was:
cryptsetup --debug luksOpen container_file container

-- 
You are receiving this mail because:
You are on the CC list for the bug.
