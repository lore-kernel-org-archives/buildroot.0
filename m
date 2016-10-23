From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Oct 2016 09:37:18 +0000
Subject: [Buildroot] [Bug 8696] xdriver_xf86-input-mouse install header
 files in target directory
In-Reply-To: <bug-8696-163@https.bugs.busybox.net/>
References: <bug-8696-163@https.bugs.busybox.net/>
Message-ID: <bug-8696-163-Q627sULvxR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|gustavo at zacarias.com.ar     |yann.morin.1998 at free.fr

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello,

I've given that issue another spin, and we still have three xorg packages
that still install headers in target/ :
  - xdriver_xf86-input-synaptics
  - xdriver_xf86-input-joystick
  - xdriver_xf86-input-mouse

I'll see how to fix them...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
