From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Nov 2016 20:40:43 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-tMuZBySlDr@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #12 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by switching from fakeroot to pseudo to build the root filesystem, done
in commit
https://git.buildroot.org/buildroot/commit/?id=8035ceb56cc3ba2541aba0d0ead3f29900d9e310.
Thanks Yann for providing the patches, and thanks Andrey for reporting the
problem in the first place!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
