From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 17:44:49 +0200
Subject: [Buildroot] [PATCH] package/libkrb5: Bumb to 1.17
In-Reply-To: <07349c8a-b244-5039-78a9-83b3e73e74f1@mind.be>
References: <20190930113931.9654-1-nerv@dawncrow.de>
 <20190930221815.6d06ffcb@windsurf.home>
 <20190930202813.GA10860@scaer>
 <951ab4ba-69ba-bd1c-d324-f110f8dd94ac@mind.be>
 <20191001153319.GB10860@scaer>
 <07349c8a-b244-5039-78a9-83b3e73e74f1@mind.be>
Message-ID: <20191001174449.57444ee1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Oct 2019 17:41:36 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > But how exactly did you conclude those bits are irrelevant or wrong?
> > That's an issue I think, that we inject our own interpretation of the
> > licenses list and conclude of a resulting state.  
> 
>  Because it's what we do for all other packages? All autotools packages have a
> GPL config.guess script, but we never mention it. For many packages we don't
> include documentation because it doesn't get built/installed. Etc.
> 
>  If we don't want to do that, we should remove _LICENSE entirely.

Yes, I agree we should do something reasonable. Striving for perfection
in this area is basically impossible.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
