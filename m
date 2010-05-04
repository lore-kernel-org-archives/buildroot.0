From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 05 May 2010 00:53:12 +0200
Subject: [Buildroot] buildroot 2010.05-rc1 fail to build gst-plugins-ugly
In-Reply-To: <4BDEF00E.4010008@digi.com>
References: <4BDEE442.4060006@digi.com>
	<x2v4d28d4b51005030825o21717459p64184c1d83be2641@mail.gmail.com>
	<4BDEF00E.4010008@digi.com>
Message-ID: <1273013593.6613.48.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le lundi 03 mai 2010 ? 17:47 +0200, Javier Viguera a ?crit :
> Lionel Landwerlin wrote:
> > Could you give us the config.log file from output/build/gst-plugins-ugly-x.y.z/
> > 
> > Regards,
> > 
> > --
> > Lionel
> 
> 
> Sure, attached.
> 

I had partialy reproduced the problem in my environment.
Here is the patch which fixed the problem.
Please test.

Regards,


-- 
Lionel Landwerlin
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix.patch
Type: text/x-patch
Size: 492 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100505/7a548830/attachment-0001.bin>
