From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 15:41:56 +0200
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Add patch for properly
 picking GL flags when building
In-Reply-To: <20170803113109.20158-1-aperez@igalia.com>
References: <20170803113109.20158-1-aperez@igalia.com>
Message-ID: <20170803154156.58737072@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Aug 2017 14:31:09 +0300, Adrian Perez de Castro wrote:
> This solves build failures caused by WebKit trying to include X11 headers
> when support for X11 is disabled in Mesa3D. A common situation is when
> configuring both GTK+ and WebKitGTK+ only with Wayland support.

Have such errors occurred in the autobuilders? If so, we want to have a
reference to such autobuilder failures in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
