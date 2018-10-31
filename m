From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 31 Oct 2018 22:49:39 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <CANQCQpZEKo9oFpVh5SPb-8NYzq88hH0sg4LzFwVqk7Zz6AQTuA@mail.gmail.com>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <CANQCQpa3y_Qs7H9aB1Y7fpW9G=V2Dr2yqM9WihrQBuqUbPoEhA@mail.gmail.com>
 <20181030202331.GI28575@scaer>
 <CANQCQpZEKo9oFpVh5SPb-8NYzq88hH0sg4LzFwVqk7Zz6AQTuA@mail.gmail.com>
Message-ID: <20181031214939.GO28575@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2018-10-30 20:18 -0500, Matthew Weber spake thusly:
> On Tue, Oct 30, 2018 at 3:23 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >     Since kernel 2.6.24, the kernel supports associating capability sets
> >     [...] stored in an extended attribute (see setxattr(2)) named
> >     security.capability.o
> :-) Fair,  security.capabilty -> security.capability

Muahaha! Thanks :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
