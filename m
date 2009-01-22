From: Stridh, Robin ActeSE <robin.stridh@acteembedded.se>
Date: Thu, 22 Jan 2009 15:52:09 +0100
Subject: [Buildroot]   busybox login problem on AT91SAM9263
References: <5B920D714A1C354D8949DBF58C2A35D604139AA8@freja.acte.local><87d4egudlg.fsf@macbook.be.48ers.dk><5B920D714A1C354D8949DBF58C2A35D604139AAE@freja.acte.local><8763k8uacw.fsf@macbook.be.48ers.dk><1232559369.11888.20.camel@elrond.atmel.com><5B920D714A1C354D8949DBF58C2A35D604139ABA@freja.acte.local>
	<877i4no5n7.fsf@macbook.be.48ers.dk>
Message-ID: <5B920D714A1C354D8949DBF58C2A35D604139ABB@freja.acte.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Robin> The conclusion is that the problem occured somewhere between
 Robin> r24822 and r24922 (jan 13 and jan 21)

Peter> Strange, nothing significantly have changed to busybox since then.
Peter> 
Peter> Could you do little binary search between those 2 revisions to close
Peter> in on the problem commit (E.G. try 24872, if that works then 897, else
Peter> 847 and so on)?

Well, I could do that, but the build time is quite long for a complete buildroot.
I could try with external toolchain, but if the problem comes from uClibc it 
won't show.

Has anyone else experienced the problem?

Ulf, could you try a recent buildroot rfs on your board?

Regards,
Robin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090122/0e9c9dd9/attachment.htm 
