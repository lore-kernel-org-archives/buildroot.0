From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Nov 2015 13:46:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8321] invalid opcode error with minidlna and ffmpeg
In-Reply-To: <bug-8321-163@https.bugs.busybox.net/>
References: <bug-8321-163@https.bugs.busybox.net/>
Message-ID: <20151125134650.994DA81830@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8321

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-25 13:46:50 UTC ---
Bug reporter never provided information about the HW being used and the
Buildroot configuration. The problem might very well be due to the use of an
invalid Buildroot configuration not matching the HW. So, closing for now.

Ramesh, if you are still facing this problem, feel free to reopen this bug, but
then please add the relevant details, as requested in my previous message.
Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
