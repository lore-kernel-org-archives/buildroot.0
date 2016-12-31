From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 15:42:06 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-zDw9zG402o@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #12 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to bilge from comment #11)

Ok, but I would strongly suggest not building as root. Several packages behave
differently when built as root (E.G. your npm issues), and Buildroot is
specifically made to not require root permissions and be used from normal
users. E.G. from the manual:

Important: you can and should build everything as a normal user. There is no
need to be root to configure and use Buildroot. By running all commands as a
regular user, you protect your system against packages behaving badly during
compilation and installation.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
