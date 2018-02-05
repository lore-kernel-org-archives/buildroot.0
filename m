From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Feb 2018 10:38:40 +0000
Subject: [Buildroot] [Bug 10726] Current libglib2.mk creates broken libglib2
 binary when using glibc 2.26
In-Reply-To: <bug-10726-163@https.bugs.busybox.net/>
References: <bug-10726-163@https.bugs.busybox.net/>
Message-ID: <bug-10726-163-kiYzH8aVyQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10726

--- Comment #2 from Matthias <porto.rio@gmx.net> ---
Created attachment 7451
  --> https://bugs.busybox.net/attachment.cgi?id=7451&action=edit
buildroot-config for a minimal qemu image which reproduces the problem

Note: Comments were removed by 'grep -v "# BR2_" .config >glib-error_defconfig'
to reduce size.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
