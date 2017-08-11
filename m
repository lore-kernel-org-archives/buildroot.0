From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Aug 2017 16:13:04 +0000
Subject: [Buildroot] [Bug 10161] unable to build u-boot.imx reliably
In-Reply-To: <bug-10161-163@https.bugs.busybox.net/>
References: <bug-10161-163@https.bugs.busybox.net/>
Message-ID: <bug-10161-163-j8zQOdW6EQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10161

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I also believe that Buildroot is not at fault here, it's U-Boot build system
that doesn't have the proper dependencies. Could you report this issue to
upstream U-Boot instead ? I'm pretty sure you can reproduce it outside of
Buildroot by running the same build commands.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
