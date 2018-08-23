From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 13:45:16 +0200
Subject: [Buildroot] [PATCH next] package/asterisk: fix compilation with
 libsrtp 2.2.0
In-Reply-To: <20180823100843.GD9365@scaer>
References: <20180823072615.32065-1-yann.morin.1998@free.fr>
 <20180823120309.08a04ced@windsurf> <20180823100843.GD9365@scaer>
Message-ID: <20180823134516.3c53ae5b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 12:08:43 +0200, Yann E. MORIN wrote:

> > The asterisk package has ASTERISK_AUTORECONF = YES, so carrying the
> > changes to the configure file doesn't seem to be very useful.  
> 
> Maybe not, but this is the *exact* patch from upstream.
> 
> When backporting, I believe it is better to apply the exact upstream
> patch (if it applies) rather than mangle it.

OK, fair enough :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
