From: Julien Letessier <julien.letessier@technosens.fr>
Date: Mon, 11 Jun 2007 16:36:14 +0200
Subject: [Buildroot] X11R7 package(s)
In-Reply-To: <20070609200959.GB32353@zelow.no>
References: <f0528b5b0706080128k7ade6f8k3e0cd6c18be550c1@mail.gmail.com>
	<Pine.LNX.4.58.0706081157250.22966@jule.tellus>
	<20070609200959.GB32353@zelow.no>
Message-ID: <f0528b5b0706110736h1ca33b9fn7affde80dd699870@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good news here:


I now have all of X11R7.2 compiling, including almost all drivers, DRI
support, and GLX support which was what I needed. [Thomas: for some reason I
didn't hit the compile error you're describing]

Obviously I didn't test all drivers, though :)
Tested in VMware, it just works ? although I wouldn't swear about its
stability.

I'm polishing the whole thing, I'll submit a (large) patch in a day or two.

2007/6/9, Thomas Lundquist <lists@zelow.no>:
>
> On Fri, Jun 08, 2007 at 11:59:13AM +0300, Assen Stoyanov wrote:
> >
> >
> > Hi Julien,
> > currently i work on X11R7 port for the buildroot,
> > i have some problems but after couple of days i will submit the new set
> of
> > patches.
>
> as did I say a few months ago.
>
> but I'm stuck in the (full) xserver with somme stupid compile error I
> just can't vet rid of. (dbxbeforereset).
>
> I just felt like putting it away and started working on the package
> issues again before work hit me.
>
> Now I guess I'll wait for 7.3 which, according to x.org, is just around
> the corner.
>
>
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070611/19f3b08e/attachment.htm 
