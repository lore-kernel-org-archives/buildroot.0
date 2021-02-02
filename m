From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 02 Feb 2021 17:13:14 +0000
Subject: [Buildroot] [Bug 13506] BR2_PACKAGE_DHCPCD missing directory
 creation
In-Reply-To: <bug-13506-163@https.bugs.busybox.net/>
References: <bug-13506-163@https.bugs.busybox.net/>
Message-ID: <bug-13506-163-tbAoARnL9y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13506

--- Comment #1 from Fabrice Fontaine <fontaine.fabrice@gmail.com> ---
This has been fixed in upstream dhcpcd since version 9.2.0 and
https://github.com/rsmarples/dhcpcd/commit/4d695e1ca3b87b45d5e5fa5119ddcb8a086ca9a0

-- 
You are receiving this mail because:
You are on the CC list for the bug.
