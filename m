From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 22:16:51 +0200
Subject: [Buildroot] [PATCH 2/7] Remove XTrap (app,
 lib & proto) as removed from X11R7.5
In-Reply-To: <4BC61598.8090907@gmail.com>
References: <1271264806-23336-1-git-send-email-will_wagner@carallon.com>
	<1271264806-23336-3-git-send-email-will_wagner@carallon.com>
	<4BC61598.8090907@gmail.com>
Message-ID: <20100414221651.6e201c9c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Apr 2010 22:20:56 +0300
Paulius Zaleckas <paulius.zaleckas@gmail.com> wrote:

> No, it is not removed, please see documentation:
> http://www.x.org/releases/X11R7.5/doc/man/man1/

Well, http://www.x.org/releases/X11R7.5/doc/RELNOTES.html#AEN620 says:

?
Support has been removed from the X servers for the following
extensions, which were obsolete, not widely used, or not working:

 * AppGroup
 * EVI
 * FontCache
 * MIT-SUNDRY-NONSTANDARD
 * TOG-CUP
 * XTrap
 * XFree86-Misc
 * XEvIE
?

Since the support for these extensions has been removed in the X
server, keeping the corresponding libraries doesn't make a lot of
sense, does it ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
