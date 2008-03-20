From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 20 Mar 2008 17:12:19 +0000
Subject: [Buildroot] Shell-Weirdness
In-Reply-To: <1206033001.2562.45.camel@nigel-x60>
References: <1206018367.6470.7.camel@luder>
	<46a136670803201005o355c88a0jf50936b9a27fd36f@mail.gmail.com>
	<1206033001.2562.45.camel@nigel-x60>
Message-ID: <1206033139.2562.48.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> The problem is the avr32 patch against GCC.
> 
> It took me the past 3 days with Jacmet to track it down.
> 
> 900-avr32-atmel.1.3.2.patch   <= THAT patch.
> 
> I'm still investigating how to fix it.

As the patches after it will more than likely fail ... remove every
patch 900 and above and it works perfectly no problem.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080320/770ebf23/attachment.pgp 
