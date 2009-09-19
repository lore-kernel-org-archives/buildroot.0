From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 19 Sep 2009 17:22:12 +0000 (UTC)
Subject: [Buildroot] [Bug 619] netkittelnet requires netkitbase to install,
 but there's no dependency
In-Reply-To: <bug-619-163@https.bugs.busybox.net/>
References: <bug-619-163@https.bugs.busybox.net/>
Message-ID: <20090919172212.26EC977767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=619


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-09-19 17:22:11 UTC ---
That was fixed in git in f5239c327e303a (E.G. the fix for #617).
I'll hide the netkit stuff under the "Hide applications that are provided by
busybox" option which is enabled by default.

We don't maintain a copy of all the busybox kconfig options, but we do have a
'make busybox-menuconfig make target to make it easy to tweak the busybox
config.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
