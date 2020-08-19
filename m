From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Aug 2020 22:31:18 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-c2EIj8m3rR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

--- Comment #2 from Christian Stewart <christian@paral.in> ---
Created attachment 8566
  --> https://bugs.busybox.net/attachment.cgi?id=8566&action=edit
Removes a faulty patch which caused a "undefined symbol" error at runtime
against aarch64 on a Raspberry Pi.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
