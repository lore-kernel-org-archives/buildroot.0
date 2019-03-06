From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Mar 2019 20:47:25 +0100
Subject: [Buildroot] [PATCH] package/openrc: new init package OpenRC
 (0.38.3)
In-Reply-To: <20190306181221.GS2721@scaer>
References: <20190228194415.7943-1-michal.lyszczek@bofc.pl>
 <befe78f5-d0b9-9f10-187d-26a918a6250c@mind.be>
 <20190305213858.GQ2721@scaer>
 <20190305232045.mylcl6l2ic26akxk@c-ml-p3510.redembedded.pl>
 <28627e2a-5cd9-dfb9-5825-bc6b294cba3b@mind.be>
 <20190306173639.GR2721@scaer> <20190306181221.GS2721@scaer>
Message-ID: <20190306194725.GT2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha?, Arnout, All,

On 2019-03-06 19:12 +0100, Yann E. MORIN spake thusly:
> On 2019-03-06 18:36 +0100, Yann E. MORIN spake thusly:
> > Maybe we're taking the problem in the wrong way, then?
> And actually, I think we are. As per [0]:

[0] https://en.wikipedia.org/wiki/OpenRC

>     Since 0.25 OpenRC includes openrc-init, which can replace /sbin/init
> 
> Also, the 0.25 release notes contain:
> 
>     This version contains an OpenRC-specific implementation of init for
>     Linux which can be used in place of sysvinit or any other init process.
> 
> I checked, and it looks like this is still the case in OpenRC's master
> branch.
> 
> So, I believe we should aim for this solution, because it drastically
> simplifies things.
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
