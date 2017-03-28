From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Mar 2017 20:34:20 +0000
Subject: [Buildroot] [Bug 9726] Raspberry Pi version B - Problems with UART
 speed in Buildroot 2016.11.2 and 2017.2
In-Reply-To: <bug-9726-163@https.bugs.busybox.net/>
References: <bug-9726-163@https.bugs.busybox.net/>
Message-ID: <bug-9726-163-gA2VcaPfX5@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9726

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for reporting this bug. However, this doesn't look like a Buildroot
problem, but more a U-Boot or Linux kernel problem. That being said, tons of
people are using our RPi defconfigs, and they seem to work fine, you are the
only one to report such issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
