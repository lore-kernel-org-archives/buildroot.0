From: Goetz Bock <bock@blacknet.de>
Date: Tue, 21 Nov 2006 10:55:14 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061120180143.456f1bd0.philippe.ney@pardes.ws>
References: <20061120154423.GG3065@priv.blacknet.de>
	<20061120180143.456f1bd0.philippe.ney@pardes.ws>
Message-ID: <20061121095514.GK3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, Nov 20 '06 at 18:01, Philippe Ney wrote:
> > this patch adds a simple cpio target, to be used with an initramfs
 
> In my application, as I also use cpio on the target, then I added a cpio
> package that provide target and host cpio.
> I use it to update the initramfs and have a simple dynamic RIM system w/o
> use of cramfs/unionfs.
> 
> If this could be useful, I will make a patch.

Shure, please provide a patch.

BTW: I wonder why there are hundrets^Wdozens of buildroot forkes, all
     with more up to date/additional packages and noone ever seams to
     provide patches on their own. 
     Do they think that buildroot is to unmodular that additional stuff
     would make it to bloated for the rest? Or is the addition just a
     hack, they always wanted to clean up, just never found the time to
     do so? Or do they simply not care?
     - Just wondering. 
--  
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
