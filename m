From: Matthew Dombroski <matthew.dombroski@gmail.com>
Date: Fri, 13 Jun 2008 20:07:19 +1200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
In-Reply-To: <20080613062509.GA27054@cloud.net.au>
References: <20080613055326.B817D3C7CA@busybox.net>
	<20080613062509.GA27054@cloud.net.au>
Message-ID: <48522AB7.9000501@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> And now we're back to the original problem where libusb gets built over
> and over again. Oh how I love autotools & our autotools packages..
>   
Hi,
I have rewritten libusb.mk. I sent it to the buildroot mailing list 
about 2 weeks ago but never heard anything.
This time I'm sending a proper patch (although its bigger than the 
resulting libusb.mk).
Can someone confirm that it works?

~Matt

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: libusb.patch
Url: http://busybox.net/lists/buildroot/attachments/20080613/3c132ffa/attachment.txt 
