From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 3 Aug 2017 18:10:34 +0300
Subject: [Buildroot] [PATCH v2 1/1] webkitgtk: Add patch for properly
 picking GL flags when building
In-Reply-To: <20170803154156.58737072@windsurf.home>
References: <20170803113109.20158-1-aperez@igalia.com>
 <20170803154156.58737072@windsurf.home>
Message-ID: <20170803181034.GB17397@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 3 Aug 2017 15:41:56 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> On Thu,  3 Aug 2017 14:31:09 +0300, Adrian Perez de Castro wrote:
> > This solves build failures caused by WebKit trying to include X11 headers
> > when support for X11 is disabled in Mesa3D. A common situation is when
> > configuring both GTK+ and WebKitGTK+ only with Wayland support.
> 
> Have such errors occurred in the autobuilders? If so, we want to have a
> reference to such autobuilder failures in the commit log.

Unfortunately, I have not seen this kind of build failure in the autobuilder
logs, sorry. But the issue certainly exists, and I can experience it myself,
and I am aware of a couple of work mates who have hit this ? one of them
Carlos Lopez, who made the patch for the WebKit CMake files.

Regards,


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170803/8fc8c81a/attachment.asc>
