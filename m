From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Jul 2018 08:52:07 +0000
Subject: [Buildroot] [Bug 11181] Switching toolchain does not work
In-Reply-To: <bug-11181-163@https.bugs.busybox.net/>
References: <bug-11181-163@https.bugs.busybox.net/>
Message-ID: <bug-11181-163-PyuCTNhkoz@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11181

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Not a bug: you need to do a full rebuild. This is documented at
https://buildroot.org/downloads/manual/manual.html#full-rebuild

-- 
You are receiving this mail because:
You are on the CC list for the bug.
