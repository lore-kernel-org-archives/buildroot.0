From: Tony Mozi <spooflinux@hotmail.fr>
Date: Mon, 15 Feb 2010 18:26:53 +0100
Subject: [Buildroot] -sh: lrzsz: not found
Message-ID: <SNT129-W3519623AE8254A748FDB73B94A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Well, I'm cross compiling a linux-2.6.22.2 for an ARM.
In order to copy files by the console to the board, I think to install lrz.
In the buildroot, lrz is not available but lrzsz is present. 
lrz and lrzsz seems to be the same thing.

Well, I tick in Package Selection For Target ---> Networking ---> lrzsz (y)
Then :
*in buildroot : make clean
*in buildroot : make
*in linux : make ARCH=arm all modules_install uImage
*in buildroot : make

I copy the new image rootfs in the board.
The directory lrzsz is present in buildroot-2009.11/package/lrzsz.

However, in serial console : 
# lrzsz
-sh: lrzsz: not found

Have you got an idea?

BR
 		 	   		  
_________________________________________________________________
Nouveau?! Tout Windows Live d?barque dans votre t?l?phone. Voir les Windows phone
http://clk.atdmt.com/FRM/go/175819071/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100215/7edb3c06/attachment.htm>
