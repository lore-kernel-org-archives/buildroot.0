From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 11:58:13 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-GdXAZAp9cm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #9 from bilge at scriptfusion.com ---
If you don't want it, that's your prerogative, I'm just trying to help.

The documentation is here: https://docs.npmjs.com/misc/config#unsafe-perm
Copied in for completeness:

unsafe-perm

    Default: false if running as root, true otherwise
    Type: Boolean

Set to true to suppress the UID/GID switching when running package scripts. If
set explicitly to false, then installing as a non-root user will fail.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
