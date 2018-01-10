From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Jan 2018 22:15:29 +0000
Subject: [Buildroot] [Bug 10301] systemd/getty unused options
In-Reply-To: <bug-10301-163@https.bugs.busybox.net/>
References: <bug-10301-163@https.bugs.busybox.net/>
Message-ID: <bug-10301-163-5BLEvSgL7F@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10301

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I've submitted at http://patchwork.ozlabs.org/patch/858587/ a patch that hides
those options when systemd is used.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
