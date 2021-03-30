From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 30 Mar 2021 10:18:20 +0000
Subject: [Buildroot] [Bug 13671] openSSH server closes connection before
 authentication is finished
In-Reply-To: <bug-13671-163@https.bugs.busybox.net/>
References: <bug-13671-163@https.bugs.busybox.net/>
Message-ID: <bug-13671-163-bOqjTc0xTP@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13671

Geert Lens <g.lens@livetech-systems.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #11 from Geert Lens <g.lens@livetech-systems.com> ---
Hi,

Thank you for all your help clarifying why this is happening. I have for the
time being implemented the patch/hack that Peter provided and will when
available switch to a toolchain that provides the needed headers.

Best regards,
Geert

-- 
You are receiving this mail because:
You are on the CC list for the bug.
