From: Jeremy Kerr <jk@ozlabs.org>
Date: Tue, 03 Jun 2014 22:11:54 +0800
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <20140601201115.GN3430@free.fr>
References: <20131111215435.GC3510@free.fr> <5369F20B.5030903@ozlabs.org>
 <20140601201115.GN3430@free.fr>
Message-ID: <538DD7AA.9080604@ozlabs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

>> How's this look?
>>
>>   http://ozlabs.org/~jk/tmp/patchwork-ART.png
> 
> Just a little reminder on this...
> 
> When are you planning on deploying that?
> Will it also show up in the output of pwclient?

I've just rolled out the initial code to patchwork.ozlabs.org. The tag
counts are all at zero to start with; I've triggered a re-parse of all
of the existing comments, so the counts should reflect reality when that
process finishes.

The filter UI and pwclient interface are still yet to be done though;
they're next on my todo list :)

Cheers,


Jeremy
