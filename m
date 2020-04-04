From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 04 Apr 2020 04:28:46 +0000
Subject: [Buildroot] [Bug 12751] OpenJdk package installation issues on
 target
In-Reply-To: <bug-12751-163@https.bugs.busybox.net/>
References: <bug-12751-163@https.bugs.busybox.net/>
Message-ID: <bug-12751-163-PylRCzfK0E@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12751

--- Comment #1 from Ameya <ameya.joshi@rockwellcollins.com> ---
I had "symlink" option selected inside "system configuration" page or maybe the 

pc_x86_64_bios_defconfig has that selected by default.

Unchecking it should solve the buildroot error 

But in our case , i do need the entire JDK on the system ,  and not just the
libs and bin?

can we have a option created in menuconfig to select that?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
