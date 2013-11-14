From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 12:29:39 +0000 (UTC)
Subject: [Buildroot] [Bug 6692] GNU nano fails to compile for x86_64
In-Reply-To: <bug-6692-163@https.bugs.busybox.net/>
References: <bug-6692-163@https.bugs.busybox.net/>
Message-ID: <20131114122939.CED9E9BBF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6692

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-14 12:29:39 UTC ---
Thanks for the report.
Normally libmagic is provided by file, it's possible that your distribution
libmagic is somehow leaking into the build.

Can you test what happens if you enable the file package and then build nano?
(i can't reproduce it locally).
So as to make the workaround conditional on file being available or not.

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
