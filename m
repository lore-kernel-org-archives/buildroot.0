From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Aug 2015 19:46:13 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150825194613.7A32D81D58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #10 from CB <christophebricout@yahoo.fr> 2015-08-25 19:46:13 UTC ---
Created attachment 6146
  --> https://bugs.busybox.net/attachment.cgi?id=6146
output/build/grub2-2.00/config.log (gzipped) content

Please fine here after the sequence history


    97  20:51   make clean
    98  20:54   make
    99  21:32   cd
/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/build/grub2-2.00
   100  21:32   ls
   101  21:32   more config.log

The attachment is the config.log from grub2-2.00

Available for others experiments if necessary.
Tnanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
