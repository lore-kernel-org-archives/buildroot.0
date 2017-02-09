From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:29:37 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
 Kodi-specific patches
In-Reply-To: <rk5nmdxipi.ln2@ID-313208.user.individual.net>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
 <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
Message-ID: <20170209232937.2a071f11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 06 Feb 2017 22:15:39 +0100, Bernd Kuhls wrote:

> > I will try, but I am unsure that your proposal will work.  
> 
> Hi Yann,
> 
> tried and failed.

Are these .a files still needed after the switch to CMake as the build
system for Kodi?

I would be OK to merge those hacks for libdvdcss, libdvdread and
libdvdnav if we know they are going to be removed when the next version
of Kodi is released. However, if these hacks are still needed for the
next version of Kodi, then I'm afraid I won't merge them. This is way
too ugly, and what Kodi is doing here is truly horrible and should be
fixed in Kodi.

This is a quite critical topic, as it's blocking the inclusion of the
new version of Kodi in Buildroot.

Also, for the patches that apply to the libdvdcss, libdvdread and
libdvdnav code base, it would be good to know if they have been
submitted to the respective upstream projects, or if it's stuff that we
may have to keep in Buildroot forever.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
