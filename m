From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 Aug 2018 18:32:53 +0000
Subject: [Buildroot] [Bug 11206] zlib: fails to build with Linaro toolchain,
 BR2_RELRO_FULL=y and BR2_FORTIFY_SOURCE_2=y
In-Reply-To: <bug-11206-163@https.bugs.busybox.net/>
References: <bug-11206-163@https.bugs.busybox.net/>
Message-ID: <bug-11206-163-mWjz1eUBzT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11206

--- Comment #3 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Sorry should have said "should be fixed by".  I did not test your config with
those patches applied, however I had the same failure without them in one of my
builds.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
