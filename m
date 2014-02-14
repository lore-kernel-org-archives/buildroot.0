From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Feb 2014 11:56:16 +0000 (UTC)
Subject: [Buildroot] [Bug 6236] binutils-2.23.2/bfd fails with undefined
 reference to __fini_array_end
In-Reply-To: <bug-6236-163@https.bugs.busybox.net/>
References: <bug-6236-163@https.bugs.busybox.net/>
Message-ID: <20140214115616.CAAC69CA02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6236

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-14 11:56:16 UTC ---
I tried building binutils on the specified configuration (buildroot 2014.02-rc1
based) and succeeded. As there was no response on the seemingly related bug
#6218, I'm closing this bug.

Please reopen if you still experience the same problem, and provide more
details.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
