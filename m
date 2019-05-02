From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 02 May 2019 07:18:20 +0000
Subject: [Buildroot] [Bug 11816] Only selected coreutils binaries are
 installed
In-Reply-To: <bug-11816-163@https.bugs.busybox.net/>
References: <bug-11816-163@https.bugs.busybox.net/>
Message-ID: <bug-11816-163-HgQJs8hpLL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11816

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Can you be more specific? It works here for me:

make coreutils && ls -lah target/usr/bin/base64 
..
lrwxrwxrwx 1 peko peko 9 May  2 09:16 target/usr/bin/base64 -> coreutils

find target -name base64                                                       
        target/usr/bin/base64

-- 
You are receiving this mail because:
You are on the CC list for the bug.
