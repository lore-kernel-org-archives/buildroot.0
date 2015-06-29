From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 19:27:20 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <CAHkwnC9Jk+xBu4VHgSZKueMPd0jJP2=3cWOvT0rcofd2ggDogw@mail.gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <20150628204622.GE3950@free.fr>
 <20150628230002.608893c0@free-electrons.com>
 <20150628212522.GH3950@free.fr>
 <CAHkwnC9Jk+xBu4VHgSZKueMPd0jJP2=3cWOvT0rcofd2ggDogw@mail.gmail.com>
Message-ID: <20150629172720.GD3669@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-06-29 10:35 +0200, Fabio Porcedda spake thusly:
> On Sun, Jun 28, 2015 at 11:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Fabio, if you could share your two defconfig (or .config) files, that'd
> > be great!
> 
> Configs:
> https://www.dropbox.com/s/tmdzhluxv69fdib/arm_external_longchaindep_defconfig?dl=0
> https://www.dropbox.com/s/9ntz73wo5ua80k9/arm_external_allyespackageconfig_defconfig?dl=0
> 
> Branch with this patch set:
>    https://github.com/fabio-porcedda/buildroot/tree/pps-v4
> 
> Branch without this patch set, on which this patch set was applied, it
> has already all the patches for using top-level-parallel make:
>    https://github.com/fabio-porcedda/buildroot/tree/pps-v4-base

OK, thanks! :-)  I'll spawn a test build later tonight (UTC+2) so it
crunches during the night.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
