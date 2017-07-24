From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 09:19:54 +0200
Subject: [Buildroot] [PATCH 12/20] package/skeleton: split out into
 skeleton-common
In-Reply-To: <93d18b26-049a-6172-9804-a655fc1bd32e@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <af100c0e2b252ccec7e9e2b8ebc88964c78bb4dc.1500398733.git.yann.morin.1998@free.fr>
 <6bcf485a-e334-33d6-4fb1-17553670d2fb@mind.be>
 <20170723094855.GB26998@scaer>
 <93d18b26-049a-6172-9804-a655fc1bd32e@mind.be>
Message-ID: <20170724091954.6bc28c19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 22:32:24 +0200, Arnout Vandecappelle wrote:

> >>  Not for this patch of course, but I think it would make sense to also move that
> >> here. But you probably thought of that already :-)  
> > 
> > Yes, that's is what I did in the first iteration, but Thomas was against
> > moving it, so I left it alone to stay there.  
> 
>  Thomas, do you remember why you were against moving the skeleton to
> package/skeleton-common?

I honestly don't remember. I believe it might be that I thought that
system/skeleton/ was a more "obvious" place to look for the skeleton,
rather than buried in package/skeleton-common/. But this argument feels
a bit fishy, so I'm not sure if that was that or something else.

I don't currently see a problem with having the base skeleton moved to
package/skeleton-common/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
