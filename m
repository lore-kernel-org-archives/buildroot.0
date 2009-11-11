From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2009 14:56:50 +0100
Subject: [Buildroot] make saveconfig ?
In-Reply-To: <9240B9AA093C4A58BEEE7BAE39B8C21A@apexjs>
References: <9240B9AA093C4A58BEEE7BAE39B8C21A@apexjs>
Message-ID: <20091111145650.4aed089e@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 11 Nov 2009 11:24:27 +0100,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I have made use of the BUILDROOT_LOCAL var to store my config files
> (bbox,uclibc,kernel and buildroot)  and my own kernel patches.
>  
> After making some changes and when i was happy with the build  i did
> a make saveconfig to get my changed config files copied back to my
> BUILDROOT_LOCAL directory.
>  
> Now i seem to do it all by hand since the make saveconfig  no longer
> exists. 

It doesn't exist anymore, because the same thing could be achieved
using another feature of Buildroot: adding support for a new board.

See http://buildroot.org/buildroot.html#board_support for details. If
you have any questions, don't hesitate.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
