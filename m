From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Oct 2019 17:04:33 +0000
Subject: [Buildroot] [Bug 9881] systemd-resolved not setting resolv.conf link
In-Reply-To: <bug-9881-163@https.bugs.busybox.net/>
References: <bug-9881-163@https.bugs.busybox.net/>
Message-ID: <bug-9881-163-dqGz58CeKg@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9881

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=0e51737575bcfbe573c8fe156f1e4a5408aad0fa.
Thanks Carlos for looking at this old issue!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
