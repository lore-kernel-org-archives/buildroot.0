From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Mar 2011 17:36:24 +0000 (UTC)
Subject: [Buildroot] [Bug 3445] Not working openssl-10.0.0d on 386sx
In-Reply-To: <bug-3445-163@https.bugs.busybox.net/>
References: <bug-3445-163@https.bugs.busybox.net/>
Message-ID: <20110314173624.259CE90015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3445

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Created attachment 3151
  --> https://bugs.busybox.net/attachment.cgi?id=3151
Fix i386 target for openssl

Give this patch a try, it should fix your problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
