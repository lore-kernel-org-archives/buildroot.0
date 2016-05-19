From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 May 2016 17:03:39 +0000
Subject: [Buildroot] [Bug 8946] Valgrind fails to build with stack
	protection turned on
In-Reply-To: <bug-8946-163@https.bugs.busybox.net/>
References: <bug-8946-163@https.bugs.busybox.net/>
Message-ID: <bug-8946-163-aZadFNhv0u@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8946

nnabavian at sonendo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Attachment #6436|0                           |1
        is obsolete|                            |

--- Comment #6 from nnabavian at sonendo.com ---
Created attachment 6441
  --> https://bugs.busybox.net/attachment.cgi?id=6441&action=edit
Buildroot config

The config is attached, with the exception that stack guard protection is off.
I had turned it off, to determine whether or not it was the problem.
Simply turn it on to to verify that valgrind does not compile.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
