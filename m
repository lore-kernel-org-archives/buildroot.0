From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Oct 2016 21:31:51 +0000
Subject: [Buildroot] [Bug 9316] U-boot fails to build if libssl-dev is not
	installed
In-Reply-To: <bug-9316-163@https.bugs.busybox.net/>
References: <bug-9316-163@https.bugs.busybox.net/>
Message-ID: <bug-9316-163-qCalh1TG1Y@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9316

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your report!

Fixed by
https://git.buildroot.org/buildroot/commit/?id=02e11d02f40ad2ec236bdcc6359729dbf2604069
and
https://git.buildroot.org/buildroot/commit/?id=59b9cc7a2dffcd5eb192609eebe3f6a9a9293462.

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
