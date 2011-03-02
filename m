From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Wed, 02 Mar 2011 20:59:10 +0000
Subject: [Buildroot] How to change the keyboard layout to German
 (qwertz) ?
In-Reply-To: <AANLkTim9Gs6oPMnXsbr+xnPy1vCt=cP_HNoTY+X-=zym@mail.gmail.com>
References: <AANLkTim9Gs6oPMnXsbr+xnPy1vCt=cP_HNoTY+X-=zym@mail.gmail.com>
Message-ID: <1299099550.16603.4.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

on X:
setxkbmap de 

on console : 
loadkeys de 

Normally that's work 

On Thu, 2011-03-03 at 00:09 +0530, Ashutosh Naik wrote: 
> Hi,
> 
> I am trying to build a distribution using buildroot 2011.02 and I am
> able to boot into the kernel and everything is working fine. :)
> 
> I am wondering how I can change my keyboard layout to "qwertz" from
> "qwerty" ? I am using a German keyboard.
> 
> Appreciate your comments
> 
> Thanks
> Ashtosh
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110302/e6b55c90/attachment.bin>
