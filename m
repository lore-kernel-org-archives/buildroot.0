From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Mar 2018 20:12:07 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <87y3jbhbqc.fsf@dell.be.48ers.dk>
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
 <20180228213104.GA16465@scaer>
 <20180228231347.1e2896a2@windsurf.lan>
 <20180301180639.GA2449@scaer> <87y3jbhbqc.fsf@dell.be.48ers.dk>
Message-ID: <20180301191207.GB2449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,All,

On 2018-03-01 19:50 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Ah, yes, you're right, sorry...
> 
>  > I was confused now, because (without this patch) I had to change my
>  > locale to be able to build systemd. My bad, sorry...
> 
> Wait, are you saying that it doesn't build with en_GB.UTF-8 locale?
> That's odd.

No, no, don't worry!

In my locale, en_GB.UTF-8, systemd-v237 *does* build fine.

But on my autobuilder, which only has C, POSIX, and C.UTF-8, the default
being POSIX, I had to explicitly set it to C.UTF-8 to test without the
patch.

So, don't worry, all is well when the current locale is any of *.UTF-8.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
