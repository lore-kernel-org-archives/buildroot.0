From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 Jun 2010 15:19:37 +0000 (UTC)
Subject: [Buildroot] [Bug 1771] Fakeroot and the
 target/generic/device_table.txt create bad device nodes.
In-Reply-To: <bug-1771-163@https.bugs.busybox.net/>
References: <bug-1771-163@https.bugs.busybox.net/>
Message-ID: <20100605151937.C2B1A12F534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1771

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, bug reproduced and understood. I've just sent a patch to the Buildroot list
that fixes it:
http://lists.busybox.net/pipermail/buildroot/2010-June/035015.html

Thanks for your report!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
