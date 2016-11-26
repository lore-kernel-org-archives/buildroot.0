From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 26 Nov 2016 14:56:28 -0200
Subject: [Buildroot] [PATCH] stella: fix bug when compiling with PPC
 altivec vectorization
In-Reply-To: <20161126153707.1238f739@free-electrons.com>
References: <1479404832-11783-1-git-send-email-sergio.prado@e-labworks.com>
 <20161119105927.57bd516a@free-electrons.com>
 <20161122233337.GA2566@tungsten.ozlabs.ibm.com>
 <CANu7NGu=fPj30W2A596uyn=+kaYkK07M3U-So7RLmMhk41Vvrg@mail.gmail.com>
 <20161126153707.1238f739@free-electrons.com>
Message-ID: <CANu7NGtZpT3G-jbAUupJOY_bUWYcgtvf4eo_9WLSU6-e61Bfrw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2016-11-26 12:37 GMT-02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:
>
> Hello,
>
> On Wed, 23 Nov 2016 19:59:11 -0200, Sergio Prado wrote:
>
> > Your solution is simpler and seems reasonable to just change from c++11
to
> > gnu++11. I will do some tests on x86 and ARM and let you know the
results.
>
> Great, thanks. I'll mark your patch as Changes Requested in patchwork.
> Can you resubmit a simplified version?

Sure. I'll finish testing and submit v2 in the next days.

Best regards,

Sergio Prado

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161126/c75b8d8f/attachment.html>
