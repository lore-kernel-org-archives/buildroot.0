From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 09:55:29 +0100
Subject: [Buildroot] [PATCH 1/1] docs: update DEVELOPERS modification
 process
In-Reply-To: <20171105060749.p5d7vwxbdveg67ck@sapphire.tkos.co.il>
References: <20171103211053.20886-1-joseph.kogut@gmail.com>
 <20171104185305.5vkjjg6iwrhctcis@tarshish>
 <20171104231427.3b3f436a@windsurf>
 <20171105060749.p5d7vwxbdveg67ck@sapphire.tkos.co.il>
Message-ID: <20171105095529.092e08be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Nov 2017 08:07:49 +0200, Baruch Siach wrote:

> > > Not sure about "or modifying". Mixing a DEVELOPERS update into a random 
> > > package update does not always make sense. The manual only refers to new 
> > > packages/boards. I suggest to drop this sentence entirely, and leave the 
> > > details for the manual.  
> > 
> > Joseph is modifying the manual here, so I'm not sure what your last
> > sentence means.  
> 
> Ah. For some reason I had the impression that this change is against the 
> DEVELOPERS file itself. So let me rephrase my suggestion:
> 
>   I suggest to drop this sentence entirely, and leave the details for the 
>   DEVELOPERS manual section.

No, I think it is good to have this sentence in the "Adding a new
package" section of the manual. Indeed new contributors are much more
likely to read this section when contributing a new package than an
obscure section specific to the DEVELOPERS file at the end of the
manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
