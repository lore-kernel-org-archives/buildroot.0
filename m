From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 02 Jun 2019 19:56:17 +0000
Subject: [Buildroot] [Bug 11926] Cross compiled Qt applications aren't
 working anymore
In-Reply-To: <bug-11926-163@https.bugs.busybox.net/>
References: <bug-11926-163@https.bugs.busybox.net/>
Message-ID: <bug-11926-163-ybRBTDycqg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11926

--- Comment #1 from ramtheconqueror at gmail.com ---
Tried setting up LD_LIBRARY_PATH with export.
Added qt.conf file as well.

[Paths]
Prefix=/usr
Libraries=lib
Headers=include/qt5
Plugins=lib/qt/plugins
Examples=lib/qt/examples

-- 
You are receiving this mail because:
You are on the CC list for the bug.
