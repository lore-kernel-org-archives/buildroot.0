From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Sep 2010 11:00:10 +0200
Subject: [Buildroot] Building a package for gdb debugging
In-Reply-To: <0D753D10438DA54287A00B027084269764451B9DB7@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B027084269764451B9DB7@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20100927110010.5fea74b9@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 24 Sep 2010 13:13:57 -0500
H Hartley Sweeten <hartleys@visionengravers.com> wrote:

> I need to build a package for debugging a segfault with gdb.  Is there an
> easy way to pass the -g switch so that gcc compiles the program with
> debugging flags?  Also, how can I keep the final executable from being
> stripped?

Enable BR2_ENABLE_DEBUG.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
