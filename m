From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Aug 2020 22:24:09 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-Iqbw9Bvigb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #8566|0                           |1
        is obsolete|                            |

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Created attachment 8571
  --> https://bugs.busybox.net/attachment.cgi?id=8571&action=edit
Fix patch, add runtime test

-- 
You are receiving this mail because:
You are on the CC list for the bug.
