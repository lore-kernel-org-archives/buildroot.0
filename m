From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  3 Feb 2011 13:00:21 +0000 (UTC)
Subject: [Buildroot] [Bug 3205] Failing chmod when running "make" in
 buildroot (openssl). /usr/lib should have been /usr/lib64
In-Reply-To: <bug-3205-163@https.bugs.busybox.net/>
References: <bug-3205-163@https.bugs.busybox.net/>
Message-ID: <20110203130021.C7C5E8F39B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3205

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
         AssignedTo|unassigned at buildroot.uclibc |gustavo at zacarias.com.ar
                   |.org                        |

--- Comment #4 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
Can you try the patch at
http://repo.or.cz/w/buildroot-gz.git/commitdiff/dddfea987f329a7dea507f987bde59f52b14ddd5
?
Fixes the issue for me.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
