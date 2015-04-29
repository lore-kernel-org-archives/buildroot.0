From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2015 10:27:24 +0000 (UTC)
Subject: [Buildroot] [Bug 29] strftime dosen't display correct localized
 month and daynames
In-Reply-To: <bug-29-163@https.bugs.busybox.net/>
References: <bug-29-163@https.bugs.busybox.net/>
Message-ID: <20150429102724.6F34881D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=29

Bernhard Reutner-Fischer <aldot@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED
   Target Milestone|---                         |0.9.34

--- Comment #2 from Bernhard Reutner-Fischer <aldot@uclibc.org> 2015-04-29 10:27:24 UTC ---
LC_ALL="pl_PL.UTF-8" ./busybox_unstripped date
?ro kwi 29 12:25:13 CEST 2015
LC_ALL="pl_PL.UTF-8" ./busybox_unstripped date -d '2009-01-09 21:15:19'
pi? sty  9 21:15:19 CET 2009

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
