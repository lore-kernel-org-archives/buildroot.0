From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Apr 2017 17:44:32 +0200
Subject: [Buildroot] [PATCH 2/3 v2] core/pk-generic: redirect only wsa
 when listing package's isntalled files
In-Reply-To: <20170406080234.405500aa@free-electrons.com>
References: <cover.1491427248.git.yann.morin.1998@free.fr>
 <1bfda8d4827de2ec26b79dbed992211a76f44da7.1491427248.git.yann.morin.1998@free.fr>
 <20170406080234.405500aa@free-electrons.com>
Message-ID: <20170406154432.GA3538@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-04-06 08:02 +0200, Thomas Petazzoni spake thusly:
> On Wed,  5 Apr 2017 23:20:58 +0200, Yann E. MORIN wrote:
> > There is no need to redirect again and again for each new file added to
> > the list; we can just redirect once and for all.
> 
> Typoes in the commit title:
> 
>  pk-generic -> pkg-generic
> 
> then I'm not even sure was you meant with "redirect only wsa when"

Neither do I. Finger-fart...

Will fix and resend. Thanks! :-)

Regards,
Yann E. MORIN.

> And isntalled -> installed.
> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
