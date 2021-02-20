From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 20 Feb 2021 16:45:17 +0000
Subject: [Buildroot] [Bug 13516] utils/scanpypi: Failure when parsing
 diffoscope
In-Reply-To: <bug-13516-163@https.bugs.busybox.net/>
References: <bug-13516-163@https.bugs.busybox.net/>
Message-ID: <bug-13516-163-SqFbhoDk86@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13516

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Conrad, All,

The first half of the issue is now supposedly fixed with commit ee8b680816 by
Thomas:
   
https://git.buildroot.org/buildroot/commit/?id=ee8b6808169e1e61b4318b44fbc706ec888c605d

And as Thomas said, we can't do much about the second half, so I'm closing this
as fixed.

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
