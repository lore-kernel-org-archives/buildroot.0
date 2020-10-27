From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Oct 2020 09:40:32 +0000
Subject: [Buildroot] [Bug 13286] The system hangs in vmware workstation on
 the line clocksource switched to clocksource tsc
In-Reply-To: <bug-13286-163@https.bugs.busybox.net/>
References: <bug-13286-163@https.bugs.busybox.net/>
Message-ID: <bug-13286-163-D5gOP4owQV@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13286

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
I am afraid this is not a Buildroot issue: this is a kernel configuration
issue. If you were building your Linux kernel manually outside of Buildroot,
you would have the same issue.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
