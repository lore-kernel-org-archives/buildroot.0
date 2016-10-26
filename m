From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Oct 2016 12:07:55 +0000
Subject: [Buildroot] [Bug 9381] check-host-rpath issues
In-Reply-To: <bug-9381-163@https.bugs.busybox.net/>
References: <bug-9381-163@https.bugs.busybox.net/>
Message-ID: <bug-9381-163-XwZbCzOZt2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9381

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Did you test with Buildroot 2016.08, or the latest master?

Indeed, after 2016.08, we have merged some patches that make sure the Buildroot
build takes place from a canonical path, in order to avoid symlink related
problems. See
https://git.buildroot.org/buildroot/commit/Makefile?id=173135df5b69dfd5ae6fe6cf2de8833c6f74c143.

If you've tried with Buildroot 2016.08, can you try with the latest master?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
