From: Koenraad lelong <buildroot@de-brouwerij.be>
Date: Thu, 14 Dec 2006 20:54:51 +0100
Subject: [Buildroot] Known working versions ?
In-Reply-To: <F38DEABE0E171746B133C1ABBD142D97060DC057@radmail.Radstone.Local>
References: <F38DEABE0E171746B133C1ABBD142D97060DC057@radmail.Radstone.Local>
Message-ID: <4581AC0B.9000307@de-brouwerij.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martyn Welch schreef:
> Hi Koenraad,
> 
> I've been having the same problems.
> 
> I found that busybox would fail with "Implicit declaration of 'bzero'"
> in tar.c. I decided to try rebuilding with tar disabled in the busybox
> configuration. It compiled, but then when I tried the image, busybox
> seemed to be mistaking 'init' for hdparm, infact everything I tried
> seemed to be mistaken for hdparm!
> 
> I managed to get the image to aleast get to a prompt by building bash
> into the image. I'm currently trying a build without busybox to see if I
> can get a larger image working with buildroot.
> 
> If it's any help, I've set buildroot to use:
> 
> Gcc 3.4.6
> Bunutils 2.16.91.0.7
> Linux 2.6.19
> Yesterdays (11 Dec06) snapshots of Busybox and uClibc.
> 
> Martyn 
> 
...
Thanks for your suggestions. In the meantime I started from scratch, did 
a checkout again and then did "make defconfig", which I found in a post 
from the mailinglist. Now "make" completes successfully.
I'm going to explore further.
Thanks again,
Koenraad Lelong.
