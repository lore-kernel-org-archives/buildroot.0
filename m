From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Apr 2021 17:23:13 +0000
Subject: [Buildroot] [Bug 13721] c-stack.c:55:26: error: missing binary
 operator before token "("
In-Reply-To: <bug-13721-163@https.bugs.busybox.net/>
References: <bug-13721-163@https.bugs.busybox.net/>
Message-ID: <bug-13721-163-O8sfyCt3Qj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13721

--- Comment #6 from stsp <stsp2@yandex.ru> ---
OK, I realized that your patch is
against buildroot as a whole, whereas
I put the patches to BR2_EXTERNAL, on
a per-package basis.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
