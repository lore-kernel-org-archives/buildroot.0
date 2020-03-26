From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2020 13:08:23 +0000
Subject: [Buildroot] [Bug 12671] leveldb won't detect that snappy is present
 (static libs only)
In-Reply-To: <bug-12671-163@https.bugs.busybox.net/>
References: <bug-12671-163@https.bugs.busybox.net/>
Message-ID: <bug-12671-163-OI7xja7zzB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12671

--- Comment #1 from maksis33 at gmail.com ---
Applying changes from https://github.com/google/leveldb/pull/686/files seems to
fix the detection (and makes the library compatible with existing compresses
databases again)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
