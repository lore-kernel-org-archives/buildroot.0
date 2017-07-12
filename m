From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Jul 2017 16:29:54 +0000
Subject: [Buildroot] [Bug 10051] make: *** No rule to make target
 'raspberrpi3_defconfig'. Stop reported with Buildroot v 2o17.05.1
In-Reply-To: <bug-10051-163@https.bugs.busybox.net/>
References: <bug-10051-163@https.bugs.busybox.net/>
Message-ID: <bug-10051-163-LuUf8s3qbw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10051

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Did you notice the typos in the defconfig you used?

Please look at "make list-defconfigs" or "ls configs/" and use defconfig names
that actually exist.

Also, please double check what you're doing before reporting issues in the bug
tracker. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
