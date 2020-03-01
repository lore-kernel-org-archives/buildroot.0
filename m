From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 14:18:45 +0100
Subject: [Buildroot] [PATCH/next 1/3] package/openrc: bump to version
 0.42.1
In-Reply-To: <CAJ4jsadHSGXq3T3gUUy7_nosa1RCX8YT9oVrMSoZ-1bHaK93RQ@mail.gmail.com>
References: <20200229232829.4177324-1-aduskett@gmail.com>
 <CAJ4jsadHSGXq3T3gUUy7_nosa1RCX8YT9oVrMSoZ-1bHaK93RQ@mail.gmail.com>
Message-ID: <20200301131845.GI8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, Adam, All,

On 2020-03-01 09:18 -0300, Carlos Santos spake thusly:
> On Sat, Feb 29, 2020 at 8:28 PM <aduskett@gmail.com> wrote:
> > From: Adam Duskett <Aduskett@gmail.com>
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[--SNIP--]
> > -OPENRC_VERSION = 0.41.2
> > +OPENRC_VERSION = 0.42.1
[--SNIP--]
> I'm working on this upgrade too and found that It's necessary to patch
>  runlevels/Makefile to avoid creating agetty.tty[1-6] if
> MKSYSVINIT=yes.

Thanks for the feedback. I've marked that series as changes-requested in
patchwork. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
