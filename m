From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 4 Aug 2014 09:05:58 +0200
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
Message-ID: <20140804070558.GK32743@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dallas,
Dallas Clement wrote,

> Hi All,
> 
> I am trying to figure out a way to produce a uSD card image file during my
> build process and do it as a non-root user. ?I am hoping to do this from a post
> image script.
> 
> I can create the image file with dd and partition it with parted as a non-root
> user. ?However, I have not figured out how to format, and populate the image
> file. ?Tools such as kpartx and losetup seem ideal for this purpose except that
> they must be run as root.
> 
> Does anyone know of a way to do this using qemu or fuse or related tools?

You could use genext2fs to generate a filesystem as non-root.

Installing a bootloader as non-root would be tricky, but is 
possible, too.
 
best regards
 Waldemar
