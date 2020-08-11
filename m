From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2020 20:10:03 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-m1ZBKlDDCk@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #12 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Peter Seiderer from comment #10)

> Is resolved/worksforme not a little harsh as there is definitely a existing
> problem (and a fix for it) and not yet determined if it is caused by the
> filesystem and/or a WSL?

genimage does not work on WSL1 (from a previous IRC discussion some weeks
ago); WSL1 was too limited to be really workable anyway. It *might* work on
WSL2 (WSL2 is usually much better since it is in fact just a VM in disguise).

And yes, "works for me", because, yes, it works for me on a *real* Linux
machine, and that's what Buildroot is made to run on:

https://buildroot.org/manual.html#requirement

Quoting: "Buildroot is designed to run on Linux systems."

If it works on other systems, all the better. If it does not and you can
come with a non-invasive fix, good, please send it. Otherwise, meh.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
