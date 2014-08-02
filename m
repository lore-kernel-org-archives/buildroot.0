From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Aug 2014 18:54:56 +0200
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
Message-ID: <20140802185456.50a354db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Sat, 2 Aug 2014 11:45:58 -0500, Dallas Clement wrote:

> I am trying to figure out a way to produce a uSD card image file during my
> build process and do it as a non-root user.  I am hoping to do this from a
> post image script.
> 
> I can create the image file with dd and partition it with parted as a
> non-root user.  However, I have not figured out how to format, and populate
> the image file.  Tools such as kpartx and losetup seem ideal for this
> purpose except that they must be run as root.
> 
> Does anyone know of a way to do this using qemu or fuse or related tools?

You could have a look at genimage that is available as a package in
Buildroot. Yann E. Morin also had developed some patches for Buildroot
to make that possible, but they were not merged due, I believe, to a
too high complexity. I'm sure he will be available to give you pointers
to these patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
