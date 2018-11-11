From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Nov 2018 17:44:14 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <90236f5b-e72e-e73a-b4fa-e982ee3cc42c@mind.be>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <762db85d-d4a9-95b5-8280-d46dfd5f2a72@mind.be>
 <20181110175724.GG2445@scaer>
 <90236f5b-e72e-e73a-b4fa-e982ee3cc42c@mind.be>
Message-ID: <20181111164414.GI2445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-11 17:02 +0100, Arnout Vandecappelle spake thusly:
> On 10/11/2018 18:57, Yann E. MORIN wrote:
> > Arnout, All,
> > 
> > On 2018-11-08 00:43 +0100, Arnout Vandecappelle spake thusly:
> [snip]
> >>  Still, I'd prefer to fix fakeroot :-)
> > 
> > Then, please be my guest! ;-) I already fixed something in fakeroot, and
> > I dread working on that code base any more...
> 
>  Time to switch to pseudo? The .11-rc period is ideal for that, isn't it? :-)

I already made that joke on IRC the other day! ;-)
    2018-11-09 22:01 < y_morin> Maybe we will eventually have to switch
                                to an alternative (pseudo?)  NOOOO!!!!!! :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
