From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Aug 2019 23:27:00 +0000
Subject: [Buildroot] [Bug 10566] php.mk is missing option --with-pgsql
In-Reply-To: <bug-10566-163@https.bugs.busybox.net/>
References: <bug-10566-163@https.bugs.busybox.net/>
Message-ID: <bug-10566-163-ghw8jHOZG0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10566

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #4 from Carlos Santos <unixmania@gmail.com> ---
Fixed by commit

  03d52226e2 package/php: add support for PostgreSQL (non-PDO)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
