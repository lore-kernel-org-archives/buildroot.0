From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Aug 2011 21:08:35 +0000 (UTC)
Subject: [Buildroot] [Bug 4093] Grub fails to install bz2 patch after
 conversion to AUTOTARGETS
In-Reply-To: <bug-4093-163@https.bugs.busybox.net/>
References: <bug-4093-163@https.bugs.busybox.net/>
Message-ID: <20110825210835.A78D38CA67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4093

--- Comment #1 from Chris <cloak@theblackroom.ca>  ---
After a proper patch of boot/grub/grub.400-nic_update2.patch.bz2,
boot/grub/grub.500-build-fix.patch is not needed.

I submitted this as a bug as I don't know the best way to fix it, but as a work
around, I just bunzip2'd grub.400-nic_update2.patch.bz2 and autotargets picked
up the patch as expected. 

I imagine the proper fix will be to have the autotargets infrastructure be able
to use compressed patches.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
