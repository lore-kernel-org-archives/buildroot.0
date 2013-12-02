From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 09:51:14 +0100
Subject: [Buildroot] [PATCH 11/15] grub2: add new package
In-Reply-To: <87ob4zskmb.fsf@dell.be.48ers.dk>
References: <1384188459-1332-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1384188459-1332-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <87r49wtcei.fsf@dell.be.48ers.dk> <20131202093525.65fe5a84@skate>
 <87ob4zskmb.fsf@dell.be.48ers.dk>
Message-ID: <20131202095114.0ec77332@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 02 Dec 2013 09:49:32 +0100, Peter Korsgaard wrote:

>  > From what I've tested, no it doesn't. I believe this is because grub
>  > legacy needed libgcc, while grub2 doesn't need libgcc, so you don't
>  > need a multilib compiler: a non-multilib x86-64 gcc can generate 32 bits
>  > code, but doesn't provide a 32 bits libgcc.
> 
>  > I can do another testing if needed, just to validate this once more
>  > (it's been a while since I did this, and I may have overlooked
>  > something).
> 
> Don't worry, I just wondered. If you already tested then that's
> fine. I'll review and apply the rest of the series tonight.

I'd prefer to do another test. Since I had installed all the multilib
stuff to test grub legacy, maybe I've overlooked since for grub2. Let
me make another test, and I'll report back.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
