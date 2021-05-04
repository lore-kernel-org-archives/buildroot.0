From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 May 2021 08:54:27 +0000
Subject: [Buildroot] [Bug 13751] libopenssl (static): huge drop in
 performance in newer versions of buildroot
In-Reply-To: <bug-13751-163@https.bugs.busybox.net/>
References: <bug-13751-163@https.bugs.busybox.net/>
Message-ID: <bug-13751-163-SEEM7c2B3A@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13751

--- Comment #3 from maksis33 at gmail.com ---
I tested the patch and it seems to fix the issue. Performance is now similar to
Buildroot 2019.02.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
