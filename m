From: Johnny Beardsmore <jny0@hotmail.com>
Date: Thu, 16 Sep 2010 11:14:51 +0000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <233D327176C4471A9A40B36BC1B4EB35@AP366>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>, ,
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>, ,
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>, ,
	<20100913102031.03481d63@surf>, ,
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>, ,
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>, ,
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>, ,
	<20100915133124.604f8b74@surf>, ,
	<SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>, ,
	<20100915190725.459aaca8@surf>,
	<SNT119-W315E2AFFA66E576AA7F27A827A0@phx.gbl>,
	<1284627065.4173.2221.camel@station1.ormlab.com>
	<SNT119-W38B5142DB23D37AEB445A827A0@phx.gbl>,
	<233D327176C4471A9A40B36BC1B4EB35@AP366>
Message-ID: <SNT119-W14BE5B1259FD7FD3BF9A8E827A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> It is fine to leave the flash drive switch as r/w but the device with buildroot rootfs on
> is best mounted ro so that, should power be removed, the ext2 filesystem is
> not open to corruption.  If you need to write to the flash drive I would
> suggest that you partition it so that the partition with buildroot rootfs is
> mounted ro and the other partition is mounted r/w.  Then you may risk
> corruption of the r/w partition but not the OS.

> The fact you get a warning on boot is because when you
> mount the drive it would seem it is having problems because the ext2
> filesystem is corrupted in some way.  This corruption could have occurred
> some time before it was booted, who knows when, but most likely when powered
> off while writing to the disk.  Hence the whole ro bit above.

I'm definitely only working with one rw partition.  It seems the two partition idea would be my best way forward at this stage.  I'll figure this out and see it it resolves my problem.

Thanks again everyone.
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100916/20c186bb/attachment.html>
