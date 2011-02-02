From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Feb 2011 16:05:58 +0000 (UTC)
Subject: [Buildroot] [Bug 415] Berkeley DB: mut_pthread.o: relocation
 R_X86_64_32 against `a local symbol' can not be used when making a shared
 object
In-Reply-To: <bug-415-163@https.bugs.busybox.net/>
References: <bug-415-163@https.bugs.busybox.net/>
Message-ID: <20110202160558.601C08F33D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=415

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar>  ---
According to my tests it seems to be fixed by commit
ef82aebff9d4046525a253f518ca1167d843cf9a by cmchao.
If not please reopen with your buildroot .config
Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
