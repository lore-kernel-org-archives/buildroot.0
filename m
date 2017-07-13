From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Jul 2017 14:08:32 +0000
Subject: [Buildroot] [Bug 9566] [kmod] Compilation fails with uclibc
In-Reply-To: <bug-9566-163@https.bugs.busybox.net/>
References: <bug-9566-163@https.bugs.busybox.net/>
Message-ID: <bug-9566-163-cgFRKiyI8t@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9566

mavik30 at yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|FIXED                       |---
             Status|RESOLVED                    |REOPENED

--- Comment #3 from mavik30 at yahoo.com ---
Hello, 

I got the same error, i followed the patch. But still same error.

Can any one tell how solve this issue. 

CCLD     libkmod/libkmod.la
libkmod/.libs/libkmod-module.o: In function `kmod_module_remove_module':
libkmod-module.c:(.text.kmod_module_remove_module+0x20): undefined reference to
`delete_module'
libkmod/.libs/libkmod-module.o: In function `kmod_module_insert_module':
libkmod-module.c:(.text.kmod_module_insert_module+0x21c): undefined reference
to `init_module'
collect2: error: ld returned 1 exit status
make[4]: *** [libkmod/libkmod.la] Error 1
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: *** [/home/marvik/buildroot/output/build/kmod-23/.stamp_built] Error 2
make: *** [_all] Error 2


Thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
