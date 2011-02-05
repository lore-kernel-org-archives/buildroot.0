From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Sat, 05 Feb 2011 19:41:54 +0000
Subject: [Buildroot] easynews sourceforge mirror is down
In-Reply-To: <87pqr7os37.fsf@macbook.be.48ers.dk>
References: <AANLkTi=WoaejX3iJWteTEprkeY=sWDFLY2dSC1PgiKHL@mail.gmail.com>
	<87pqr7os37.fsf@macbook.be.48ers.dk>
Message-ID: <1296934914.20053.4.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2011-02-05 at 08:31 +0100, Peter Korsgaard wrote: 
> >>>>> "bruce" == bruce bushby <bruce.bushby@gmail.com> writes:
> 
>  bruce> Hi
> 
>  bruce> Not sure if the site is down for maintenance but the "easynews"
>  bruce> sourceforge mirror is no longer responding.
> 
> Yeah, I noticed as well. It's probably related to the recent sf.net
> breakin attempts.
> 
>  bruce> To get around this with existing config I simply added a local hosts file entry
>  bruce> using the IP address for "switch.dl.sourceforge.net"
> 
>  bruce> echo "130.59.138.21 easynews.sourceforge.net" >> /etc/hosts
> 
> Or you can simply select another sf.net mirror in Build options ->
> Mirrors and download locations -> Sourceforge mirror site ;)
> 

Yeah , 
using 
downloads.sourceforge.net will redirect for a good mirror 
for example : 
wget
http://downloads.sourceforge.net/sourceforge/freetype/freetype-2.4.4.tar.bz2

redirect to kent or
http://sunet.dl.sourceforge.net/project/freetype/freetype2/2.4.4/freetype-2.4.4.tar.bz2

so edit .config and replace easynews with kent or sunet or other that is
near to you . 

Regards,
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110205/0f1438b6/attachment.bin>
