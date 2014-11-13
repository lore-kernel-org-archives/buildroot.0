From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 09:20:25 +0100
Subject: [Buildroot] out-of-tree kernel modules and linux header versions
In-Reply-To: <CAJpxd06Luke+9Jgd7+Ka68yUwUh1Lxu93dfhJcG_-LzZ+irVqA@mail.gmail.com>
References: <CAJpxd07isuV8UB+d2pWCjoYsdWnG7T5XM_Hm6vxyrTJi_gz9DQ@mail.gmail.com>
 <CAJpxd06Luke+9Jgd7+Ka68yUwUh1Lxu93dfhJcG_-LzZ+irVqA@mail.gmail.com>
Message-ID: <20141113092025.4bc7cfe2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bryce Schober,

On Wed, 12 Nov 2014 18:16:06 -0800, Bryce Schober wrote:

> > I see that there have been quite a few changes to the external toolchain
> > wrapper since 2011.08, so maybe I'll see if I can back-port it to my old
> > buildroot...
> >
> 
> Ugh. Yeah, that's not really gonna work, I think. There are way too many
> changes in buildroot make infrastructure since then.

Why do you simply upgrade, instead of back-porting stuff?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
