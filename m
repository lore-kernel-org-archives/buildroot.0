From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 21:53:12 +0200
Subject: [Buildroot] gc20 no space left issue
In-Reply-To: <87vax1ib2q.fsf@dell.be.48ers.dk>
References: <20161009204509.49fc7a4b@free-electrons.com>
 <87vax1ib2q.fsf@dell.be.48ers.dk>
Message-ID: <20161009215312.7f8a98bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 09 Oct 2016 21:20:13 +0200, Peter Korsgaard wrote:

>  > Could you see if you can fix this ?  
> 
> I dropped some of the bigger tarballs from instance-*/dl, so now there's
> 11G free.

OK.

>  > Perhaps we should start thinking about a way of ignoring the build
>  > results caused by a lack of disk space ?  
> 
> Perhaps, if we can come up with a simple & robust way of detecting
> it. On the other hand, this doesn't happen that often - And when it does
> it is good to get notified about it.

Yes, I don't know if we can detect it reliably, indeed. Let's keep
things as they are for now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
