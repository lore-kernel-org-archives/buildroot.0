From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 13:22:08 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <6cfc163d-8a6a-20a3-8eae-b2cb7ee65746@free.fr>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <6cfc163d-8a6a-20a3-8eae-b2cb7ee65746@free.fr>
Message-ID: <20160829132208.647a1878@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Aug 2016 12:19:54 +0200, Julien Boibessot wrote:

> > +N:	Julien Boibessot <julien.boibessot@armadeus.com>
> > +F:	configs/armadeus*
> > +F:	package/libcddb/  
> 
> + board/armadeus/*

This last "*" is not needed. Directories are by default handled
recursively. Patterns are only needed if you want to match several
directories, like package/python-* for example.

> + package/gpm
> + package/lbreakout2
> + package/libmodbus
> + package/ltris
> + package/opentyrian
> + package/pygame
> + package/smstools3

All added, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
