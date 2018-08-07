From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 Aug 2018 17:32:50 +0000
Subject: [Buildroot] [Bug 11206] zlib: fails to build with Linaro toolchain,
 BR2_RELRO_FULL=y and BR2_FORTIFY_SOURCE_2=y
In-Reply-To: <bug-11206-163@https.bugs.busybox.net/>
References: <bug-11206-163@https.bugs.busybox.net/>
Message-ID: <bug-11206-163-uTkro5HJrX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11206

--- Comment #1 from Jan Kundr?t <jan.kundrat@cesnet.cz> ---
Changing from BR2_RELRO_FULL=y to BR2_RELRO_PARTIAL=y makes it build again.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
