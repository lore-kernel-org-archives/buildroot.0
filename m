From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Mar 2019 22:11:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/mender: Fix service file.
In-Reply-To: <20190307214746.19af3c2e@windsurf>
References: <20190306154953.119334-1-aduskett@gmail.com>
 <20190307214746.19af3c2e@windsurf>
Message-ID: <20190307211130.GV2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

This one is candidate for backporting to 2019.02.x

Regards,
Yann E. MORIN.

On 2019-03-07 21:47 +0100, Thomas Petazzoni spake thusly:
> On Wed,  6 Mar 2019 10:49:53 -0500
> aduskett at gmail.com wrote:
> 
> > From: Adam Duskett <Aduskett@gmail.com>
> > 
> > There was a missing double quotes that would prevent the service from starting.
> > 
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> > ---
> >  package/mender/mender.service | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Applied to master, thanks.
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
