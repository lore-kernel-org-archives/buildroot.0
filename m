From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 21:17:09 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-YzHCY9w5p0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #16 from bilge at scriptfusion.com ---
Peter, that's exactly correct. There is nothing on the system other than what
Buildroot builds, and as you can see from the configuration:

# BR2_PACKAGE_BUSYBOX is not set

There is no `env` on the target system unless Buildroot builds it, which it
currently does not.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
