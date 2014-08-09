From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  9 Aug 2014 11:52:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7280] CMake toolchain file uses the FORCE
 attribute on CMAKE_CXX_FLAGS
In-Reply-To: <bug-7280-163@https.bugs.busybox.net/>
References: <bug-7280-163@https.bugs.busybox.net/>
Message-ID: <20140809115227.527B09D3FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7280

Samuel Martin <s.martin49@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|unassigned at buildroot.uclibc |s.martin49 at gmail.com
                   |.org                        |

--- Comment #4 from Samuel Martin <s.martin49@gmail.com> 2014-08-09 11:52:26 UTC ---
(In reply to comment #3)
> Samuel, could you have a look at this maybe?

Yep, don't worry, I'm on it ;-)

So far, removing FORCE option in the toolchainfile.cmake.in looks ok, except
for cdrkit :-/ I'll investigate this and hopefully post and fix during the rc
month.

Regards,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
