From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 01 Dec 2016 14:23:02 +0000
Subject: [Buildroot] [Bug 9416] Running on 2016.11-rc1 second make fails
 "makedevs: line 23: Couldnt create node
 /buildroot-2016.11-rc1/output/target/dev/console: File exists"
In-Reply-To: <bug-9416-163@https.bugs.busybox.net/>
References: <bug-9416-163@https.bugs.busybox.net/>
Message-ID: <bug-9416-163-z9DU67oAHc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9416

Andy Shevchenko <andy.shevchenko@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|FIXED                       |---
             Status|RESOLVED                    |REOPENED

--- Comment #2 from Andy Shevchenko <andy.shevchenko@gmail.com> ---
Have another message, what did I miss?

makedevs: line 24: node ...output/target/dev/console exists but is of wrong
file type
fs/cpio/cpio.mk:42: recipe for target '...output/images/rootfs.cpio' failed

93106e9 Update for 2016.11-rc3

-- 
You are receiving this mail because:
You are on the CC list for the bug.
