From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Apr 2017 21:37:55 +0000
Subject: [Buildroot] [Bug 9826] post-build scritp - symlinks created in
 post-build script are overwritten after exit of the script
In-Reply-To: <bug-9826-163@https.bugs.busybox.net/>
References: <bug-9826-163@https.bugs.busybox.net/>
Message-ID: <bug-9826-163-kxG6znXoUt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9826

Timo V?lim?ki <timo.valimaki@sensoan.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Timo V?lim?ki <timo.valimaki@sensoan.com> ---
Thanks.

I have totally missed the fakeroot script - perhaps I have just skipped it as
didn't understood when to use it.

I moved /etc/group, /etc/passwd and /etc/shadow handling from post-build script
to fakeroot script.  Result: works as it should be.

I mark bug resolved as invalid.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
