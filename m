From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Mar 2017 14:27:30 +0000
Subject: [Buildroot] [Bug 9721] version 2017.02: no acceptable m4 could be
	found in $PATH
In-Reply-To: <bug-9721-163@https.bugs.busybox.net/>
References: <bug-9721-163@https.bugs.busybox.net/>
Message-ID: <bug-9721-163-YaSJIYR6dK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9721

--- Comment #3 from louigi600 at yahoo.it ---
I think solved that issue that may have been induced (not sure how exactly
maybe at some point it's looking in /proc/mounts) by working chroot without
/sys /proc mountd on the chroot env. Unfortunately I don't have the failing
logs anymore.
I've got it to compile now but I've other issues while using the built
xtoolchain. 

I know it's not necessary to compile using root ... but appart from being
superuser, root is just like any other user on the system.

I've seen some unix systems where the user homes are un /usr/home so that would
be a subfolder of usr anyway ... that's another odd thing a folder is a folder
and why should I not be able to build this from any folder I like to choose on
my system ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
