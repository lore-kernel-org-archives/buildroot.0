From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Jan 2018 22:20:54 +0000
Subject: [Buildroot] [Bug 10541] QT5 package leaves out aarch64 in
 BR2_PACKAGE_QT5_JSCORE_AVAILABLE
In-Reply-To: <bug-10541-163@https.bugs.busybox.net/>
References: <bug-10541-163@https.bugs.busybox.net/>
Message-ID: <bug-10541-163-w7SzRu4nio@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10541

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=ec8f5db9bbd172b2cdb571727eef9819b836c4a7.
Thanks JD for reporting the bug, and thanks Peter for looking into it and
providing a patch!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
