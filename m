From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 May 2020 20:21:30 +0000
Subject: [Buildroot] [Bug 12946] Grub: Decompressor is too big.
In-Reply-To: <bug-12946-163@https.bugs.busybox.net/>
References: <bug-12946-163@https.bugs.busybox.net/>
Message-ID: <bug-12946-163-Cp08qk0uZO@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12946

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Stefan,

> which part is it that you cannot reproduce on your system - the build failure related to automake, or the original issue, i.e. the error thrown by grub-mkimage?

Obviously it is your original issue I am speaking about, and that I can't
reproduce.

> The original issue seems to depend on the environment's compiler used, not the one selected in Buildroot. According to https://lists.gnu.org/archive/html/grub-devel/2020-03/msg00217.html, it only occurs at least with GCC 8.3.0 and GCC 9.2.1 (which I am using), but not with GCC 7.5.0.

As I said, I am also on Ubuntu 19.10, so using gcc 9.2.1.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
