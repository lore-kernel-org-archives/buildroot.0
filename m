From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Wed, 04 Jan 2012 12:12:54 +0100
Subject: [Buildroot] [PATCH 0/2] V2: Add defconfigs for LPC3250 boards
In-Reply-To: <20120103210959.703bc30b@skate>
References: <1325616568-17471-1-git-send-email-abelloni@adeneo-embedded.com>
 <20120103210959.703bc30b@skate>
Message-ID: <1325675574.2442.18.camel@emblysd024.adetel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2012-01-03 at 21:09 +0100, Thomas Petazzoni wrote:
> Le Tue,  3 Jan 2012 19:49:26 +0100,
> Alexandre Belloni <abelloni@adeneo-embedded.com> a ?crit :
> 
> > I also fixed the gcc version to 4.3.x as using a later version seems to
> > break the network drivers.
> 
> It's not a show-stopper for inclusion in Buildroot, but is there some
> debugging effort going on to fix this?
> 

Not so sure but I reported the bug upstream and it seems that anyway,
they it the same bug while using their 2.6.39 port.

I'll ask again.

-- 
Alexandre Belloni

Adeneo Embedded
Adetel Group

2, ch. du Ruisseau - 69134 Ecully, France

www.adeneo-embedded.com
 
