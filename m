From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Mar 2012 16:58:11 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120301165811.3B9F690BEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

Ra?l S?nchez Siles <rsanchezs@infoglobal.es> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #4058|0                           |1
        is obsolete|                            |

--- Comment #7 from Ra?l S?nchez Siles <rsanchezs@infoglobal.es> 2012-03-01 16:58:10 UTC ---
Created attachment 4064
  --> https://bugs.busybox.net/attachment.cgi?id=4064
Patch against git master head.

Thanks again, Thomas. It looks it has worked. Find attached a patch against the
current master head.

Once this is applied I'd say this bug report can be closed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
