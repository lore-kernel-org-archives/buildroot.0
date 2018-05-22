From: daggs <daggs@gmx.com>
Date: Tue, 22 May 2018 09:18:32 +0200
Subject: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
In-Reply-To: <87bmd8ismc.fsf@dell.be.48ers.dk>
References: <20180505105844.5278-1-romain.naour@gmail.com>
 <20180520124507.23c2a29b@windsurf>
 <71945c16-5343-400c-01fe-44f1d5cb31c2@gmail.com>
 <87bmd8ismc.fsf@dell.be.48ers.dk>
Message-ID: <trinity-f4d4faec-6692-4477-bdc0-4fdafca1e308-1526973512041@3c-app-mailcom-bs08>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Peter,

> Sent: Tuesday, May 22, 2018 at 12:52 AM
> From: "Peter Korsgaard" <peter@korsgaard.com>
> To: "Romain Naour" <romain.naour@gmail.com>
> Cc: "Dagg Stompler" <daggs@gmx.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] package/gcc: add support for gcc 8.1
>
> >>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
> Hi,
> 
>  > See the reply from Arnout and Dagg for gcc 4.9:
>  > http://patchwork.ozlabs.org/patch/767087
> 
>  > I'm not sure that the odroidc2 defconfig is able to build with gcc >= 4.9 since
>  > it's stuck at kernel odroidc2-3.14.y and uboot odroidc2-v2015.01.
>  > Dagg, what do we do for this board?
> 
> I believe that mainline support for this board is fairly far, so if that
> is the only thing keeping 4.9 around I think we can drop it.
> 

afaik, the mainline support for this board lacks proper vpu support.
in addition, due to the patchwork issue, my last bunch of patches of mainline support were lost and got ignored so I've decided to stop pursuing this matter.

as said in another mail here, I'm unable to boot the board as I've misplaced the ac adapter, I can try looking for it again but it won't be until the weekend.
you said a while ago you have access to such board, if you have time to bump the vendor kernel and uboot revs to latest and test if it works, maybe this issue can be resolved without dropping support for this board.

Dagg. 
