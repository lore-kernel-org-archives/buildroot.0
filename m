From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Thu, 05 Jan 2012 10:51:29 +0100
Subject: [Buildroot] [PATCH v3 1/2] lpc32xx: Add CDL to the available
 bootloaders
In-Reply-To: <20120105082913.307b0c4a@skate>
References: <1325697215-29906-1-git-send-email-abelloni@adeneo-embedded.com>
 <1325697215-29906-2-git-send-email-abelloni@adeneo-embedded.com>
 <20120105082913.307b0c4a@skate>
Message-ID: <1325757089.2442.39.camel@emblysd024.adetel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2012-01-05 at 08:29 +0100, Thomas Petazzoni wrote:

> Le Wed,  4 Jan 2012 18:13:34 +0100,
> Alexandre Belloni <abelloni@adeneo-embedded.com> a ?crit :
> 
> > @@ -7,6 +7,7 @@ source "boot/uboot/Config.in"
> >  source "boot/at91bootstrap/Config.in"
> >  source "boot/at91dataflashboot/Config.in"
> >  source "boot/xloader/Config.in"
> > +source "boot/lpc32xxcdl/Config.in"
> 
> Sorry, I didn't notice that in my previous review. Entries should be
> ordered alphabetically.
> 

I read that on the mailing list but that is not the case at the moment,
should I reorder all the entries  ?



-- 
Alexandre Belloni

Adeneo Embedded
Adetel Group

2, ch. du Ruisseau - 69134 Ecully, France

www.adeneo-embedded.com
 




-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120105/958a1476/attachment.html>
