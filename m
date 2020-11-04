From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Nov 2020 18:17:20 +0000
Subject: [Buildroot] [Bug 13291] BR2_DL_DIR is ignored when creating
 defconfig
In-Reply-To: <bug-13291-163@https.bugs.busybox.net/>
References: <bug-13291-163@https.bugs.busybox.net/>
Message-ID: <bug-13291-163-9Wzes6i0xU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13291

--- Comment #1 from Lance Fredrickson <lancethepants@gmail.com> ---
correction: only 'make savedefconfig' is not working. It is pulling in and
using the value when already in the defconfig.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
