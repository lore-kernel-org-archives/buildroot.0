From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Jun 2018 20:10:19 +0000
Subject: [Buildroot] [Bug 11086] download/git submodule breaks on symlinked
 dl folder
In-Reply-To: <bug-11086-163@https.bugs.busybox.net/>
References: <bug-11086-163@https.bugs.busybox.net/>
Message-ID: <bug-11086-163-I4KWiYlAa3@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11086

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Created attachment 7626
  --> https://bugs.busybox.net/attachment.cgi?id=7626&action=edit
Tentative to fix dl dir wen it is a symlink

Michael,

Could you tgry the attached patch, please?

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
