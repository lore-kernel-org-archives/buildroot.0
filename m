From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 21:58:32 +0200
Subject: [Buildroot] [PATCH] inotify-tools: add license information
In-Reply-To: <503538F7.9000102@lucaceresoli.net>
References: <1345619321-4644-1-git-send-email-spdawson@gmail.com>
 <20120822194521.48a4060c@skate> <503538F7.9000102@lucaceresoli.net>
Message-ID: <20120822215832.12e58fe5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 21:54:31 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> > I've applied your patch with GPLv2+, and we'll listen to comments from
> > others if they have a better idea on how to take the proper decision on
> > this.
> 
> iostat has the same licensing policy.
> 
> The GPLv2 (reported in the COPYING file for inotify-tools, as well as 
> iostat)
> states:
> 
>    If the Program does not specify a version number of
>    this License, you may choose any version ever published by the Free 
> Software
>    Foundation.
> 
> So:
> INOTIFY_TOOLS_LICENSE = GPL

Even if the program includes a specific version of the GPL in its
COPYING file (in this case GPLv2) ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
