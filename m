From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Feb 2014 08:09:50 +0000 (UTC)
Subject: [Buildroot] [Bug 5582] libiconv 1.14 failed to build
In-Reply-To: <bug-5582-163@https.bugs.busybox.net/>
References: <bug-5582-163@https.bugs.busybox.net/>
Message-ID: <20140212080951.426369C9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5582

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-12 08:09:49 UTC ---
I tried reproducing this problem, but can't. I'm using a basic ARM uclibc
toolchain
(http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config)
but libiconv builds successfully.

Do you still have this problem?
Have you tried building from a clean buildroot tree? 

I'm currently closing this bug.
If you still experience this problem, please reopen and provide more details,
for example the .config/defconfig file you are using.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
