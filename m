From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Jun 2017 19:43:56 +0000
Subject: [Buildroot] [Bug 9886] Build fails with "unexpected EOF while
 looking for matching `"'" if PATH contains a newline
In-Reply-To: <bug-9886-163@https.bugs.busybox.net/>
References: <bug-9886-163@https.bugs.busybox.net/>
Message-ID: <bug-9886-163-rPiaXCNvuK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9886

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
A patch has been applied in master to fix that:
   
https://git.buildroot.org/buildroot/commit/?id=f00d6ec67bd6fed6ff8fd322d60d026ec87d8a6e

Thanks for the report.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
