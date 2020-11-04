From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Nov 2020 21:43:29 +0000
Subject: [Buildroot] [Bug 13291] BR2_DL_DIR is ignored when creating
 defconfig
In-Reply-To: <bug-13291-163@https.bugs.busybox.net/>
References: <bug-13291-163@https.bugs.busybox.net/>
Message-ID: <bug-13291-163-pp9BYZXwgg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13291

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
This is a recent change done on purpose:
https://git.buildroot.org/buildroot/commit/?id=36edacce9c2c3b90f9bb11a5d2208e8edf7bbe63

What is your use case for wanting to store a custom download directory location
in the defconfig?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
