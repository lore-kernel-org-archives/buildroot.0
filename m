From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Aug 2016 22:23:21 +0200
Subject: [Buildroot] Analysis of build results for 2016-07-29
In-Reply-To: <CA+TH9V=SEgH611feP7Qu1qp=fLg6hOuoDFx0jx4puBkjMywDLQ@mail.gmail.com>
References: <20160730063032.3A6FE10161A@stock.ovh.net>
 <20160730232322.4eca1a53@free-electrons.com>
 <CA+TH9V=SEgH611feP7Qu1qp=fLg6hOuoDFx0jx4puBkjMywDLQ@mail.gmail.com>
Message-ID: <20160803202321.GA5988@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

[Please trim the mail to only quote what you are replying to.]

On 2016-08-03 22:10 +0200, Angelo Compagnucci spake thusly:
> 2016-07-30 23:23 GMT+02:00 Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com>:
> > >          arm |              host-mono-4.4.1.0 | NOK |
> > http://autobuild.buildroot.net/results/ed15afa208f5c6874b86a30570af59d785820060/
> 
> The error is
> 
> "Mono requires /proc to be mounted."
> 
> Something strange with the autobuilder? As today, five days are passed
> withouth errors. Probably resolved?

Yes, forget about that one; it happens on my server.

I was investigating why there were issues with the downloads, and I
accidentally unmounted /proc from the chroot in which the autobuilder
runs.

Just forget that one. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
