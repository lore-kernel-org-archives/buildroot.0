From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Wed, 21 Jan 2009 12:10:19 +0100
Subject: [Buildroot]  busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local>
	<87d4egudlg.fsf@macbook.be.48ers.dk>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter and thanks for your quick reply!

Peter> Then it's time to debug. Do you have an /etc/securetty on the target
Peter> and does it list ttyS0?

Yes, ttyS0 is listed in /etc/securetty. The only change i made from the non 
working to the working version is changing the busybox version and rebuild buildroot. 

Peter> If that's ok, then I would suggest you enable strace, boot with
Peter> init=/bin/sh and send the strace output of running login here to the
Peter> list.

I tried passing init=/bin/sh to the kernel, but then I end up without a shell. 
The console is still responsive and echoes everything I type and produces 
newlines when I hit return but nothing more.

Regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090121/9ba5ddae/attachment.htm 
