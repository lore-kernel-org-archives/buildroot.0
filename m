From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 07 Jun 2018 14:05:37 +0000
Subject: [Buildroot] [Bug 11076] Docker containerd installed to incorrect
 path
In-Reply-To: <bug-11076-163@https.bugs.busybox.net/>
References: <bug-11076-163@https.bugs.busybox.net/>
Message-ID: <bug-11076-163-yGkRgWBJuQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11076

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=ded50f69c691e4b4a391ee23ec466abaad4bed99.
Thanks Sam!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
