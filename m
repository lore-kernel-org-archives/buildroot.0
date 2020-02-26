From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Feb 2020 09:19:08 +0000
Subject: [Buildroot] [Bug 12581] 2020.02-rc1 glibc failing to build on
 fedora 31
In-Reply-To: <bug-12581-163@https.bugs.busybox.net/>
References: <bug-12581-163@https.bugs.busybox.net/>
Message-ID: <bug-12581-163-ghm7tcPGmF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12581

--- Comment #4 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
I deleted the cache and disabled cashing in the config an it now builds
successfully. Thanks, Ian

-- 
You are receiving this mail because:
You are on the CC list for the bug.
