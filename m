From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 07 Aug 2018 18:31:48 +0000
Subject: [Buildroot] [Bug 11206] zlib: fails to build with Linaro toolchain,
 BR2_RELRO_FULL=y and BR2_FORTIFY_SOURCE_2=y
In-Reply-To: <bug-11206-163@https.bugs.busybox.net/>
References: <bug-11206-163@https.bugs.busybox.net/>
Message-ID: <bug-11206-163-KhLorldlMF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11206

--- Comment #2 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Fixed by
http://patchwork.ozlabs.org/project/buildroot/list/?series=54943

and 

http://patchwork.ozlabs.org/patch/944700/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
