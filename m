From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 16 Sep 2015 14:31:08 +0000 (UTC)
Subject: [Buildroot] [Bug 8341] Getting EGL Error: Could not create the egl
 surface: error = 0x300b on RPI-2b board.
In-Reply-To: <bug-8341-163@https.bugs.busybox.net/>
References: <bug-8341-163@https.bugs.busybox.net/>
Message-ID: <20150916143108.2C5D481E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8341

--- Comment #4 from Dave <davy2002a@gmail.com> 2015-09-16 14:31:07 UTC ---
(In reply to comment #2)
> Also, please indicate the RPi FW config.txt that you're using (can be the
> default one provided by Buildroot).
> 
> The one in Buildroot has small values for the GPU memory sizes, which are not
> enough for some video applications. Maybe these sizes should be increased in
> Buildroot.

Ok, in a nutshell...

Version: 2015.11-git-00108-g708818a

Nature of custom application: A simple Qt 5 WebKit based browser intended to
view limited numbers of sites, however intended to take full advantage of EGLFS
HW Acceleration.

As stated previously, whenever the said application was executed, it would
refuse to run and output a 0x300b error code.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
