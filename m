From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Oct 2013 10:44:55 +0000 (UTC)
Subject: [Buildroot] [Bug 6578] udisks package broken
In-Reply-To: <bug-6578-163@https.bugs.busybox.net/>
References: <bug-6578-163@https.bugs.busybox.net/>
Message-ID: <20131021104455.6D1719BAC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6578

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-10-21 10:44:54 UTC ---
I tried on the latest master and udisks builds fine here. 
The 'gudev' version that is being checked is specified in package/udev/udev.mk.
Current buildroot has udev-182, and udisks (1.0.4) needs udev-147 or later.

What version of buildroot are you using? Since buildroot was already at
udev-173 in version 2011.08, I think you are using a very old version. 
You should either upgrade buildroot, or manually fix the problem by bumping
udev (and any possible dependency).

If you are using a recent version of buildroot and udev is at a sufficiently
recent version, there may be another problem. In this case, please reopen this
bug and provide more information.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
