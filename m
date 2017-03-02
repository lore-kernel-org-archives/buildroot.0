From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 Mar 2017 17:28:24 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-k9rH5elbJj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #6911|0                           |1
        is obsolete|                            |
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |

--- Comment #21 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Created attachment 6916
  --> https://bugs.busybox.net/attachment.cgi?id=6916&action=edit
Debug mkusers - paranoid

(In reply to Paul Stewart from comment #19)

Damn, that's uterly weird...

OK, so let's be a little bit more paranoiac. Can you test with the attached
patch, please?

The expected output is described in that patch, too.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
