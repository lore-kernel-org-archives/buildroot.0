From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 20:10:22 +0200
Subject: [Buildroot] manipulating raw disk images as non-root user
In-Reply-To: <CAE9DZUSKbr3gzUW=Oh=f7P9q_Fs=nh7S0OpxyL_tbYV3NfxhAQ@mail.gmail.com>
References: <CAE9DZUThNrdD2AOHwsJRZG6fJh3=MRGe+Ggnh4ZrRxgXatJvWA@mail.gmail.com>
 <20140804070558.GK32743@waldemar-brodkorb.de>
 <CAE9DZUSKbr3gzUW=Oh=f7P9q_Fs=nh7S0OpxyL_tbYV3NfxhAQ@mail.gmail.com>
Message-ID: <20140804201022.5499bf8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Mon, 4 Aug 2014 12:56:40 -0500, Dallas Clement wrote:

> Wow!  This is perfect.  I searched all over for a tool like this.  Couldn't
> find anything.  Thanks Waldemar!  Do you know of a similar tool to make /
> populate fat partitions.  I need to work with both fat and ext2.

Huh? genext2fs has been part of Buildroot since years, and is directly
usable by asking Buildroot to generate an ext2/3/4 image in "Filesystem
images".

Regarding FAT partition, I guess most people use the mtools?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
