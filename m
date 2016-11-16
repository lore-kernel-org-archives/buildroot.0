From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 23:31:34 +0100
Subject: [Buildroot] [PATCH for/next] krb5: new package
In-Reply-To: <08250588-8b84-2d9a-56fd-d1ba8e6ab774@mind.be>
References: <20161108005032.11340-1-arnout@mind.be>
 <20161116000427.74c92b5e@free-electrons.com>
 <08250588-8b84-2d9a-56fd-d1ba8e6ab774@mind.be>
Message-ID: <20161116233134.574ed050@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Nov 2016 09:45:12 +0100, Arnout Vandecappelle wrote:

> > We generally don't like to use bundled libraries. Are those libraries
> > likely to be used by other packages? Or are they so specific to krb
> > stuff that it isn't worth having separate packages for them?  
> 
>  You are so right. libss is part of e2fsprogs, and libverto makes sense
> stand-alone. I can't find a libet in Debian, so I guess it doesn't make much
> sense on its own.
> 
>  This was anyway just a bit of help for Charles and Daniel, so it may take some
> time before I respin...

OK, so I'm marking "Changes Requested" in the mean time. Charles, if
you could take over this patch and do the suggested improvements, I
guess Arnout would be more than happy :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
