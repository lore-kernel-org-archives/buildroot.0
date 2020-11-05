From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Nov 2020 20:52:40 +0000
Subject: [Buildroot] [Bug 13291] BR2_DL_DIR is ignored when creating
 defconfig
In-Reply-To: <bug-13291-163@https.bugs.busybox.net/>
References: <bug-13291-163@https.bugs.busybox.net/>
Message-ID: <bug-13291-163-3DokOzbaIm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13291

--- Comment #3 from Lance Fredrickson <lancethepants@gmail.com> ---
For various projects I set BR2_DL_DIR using menuconfig to point to a central
directory for source packages.  I use savedefconfig to store the config cause
it looks nice and is easier to tell what is going on.

Is that commit talking about when BR2_DL_DIR is 'set' as an environment
variable or as a value you 'set' in a config using menuconfig?  I can
understand why you wouldn't want to pull in environment variabless while using
savedefconfig. However, I would assume if it's left configurable in the
menuconfig that it would be preserved in a minimalized version of that config.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
