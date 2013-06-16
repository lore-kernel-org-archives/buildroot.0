From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jun 2013 19:03:05 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130616180054.58f52914@skate>
References: <20130616180054.58f52914@skate>
Message-ID: <20130616170305.GI3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-16 18:00 +0200, Thomas Petazzoni spake thusly:
> I've made a number of small changes in the autobuilders configuration
> and setup:
> 
>  *) I've extended the mail notification script to be able to send
>     per-architecture notification to persons who are specifically taking
>     care of a given architecture. So far, Sonic Zhang is receiving a
>     notification for Blackfin related failures, and Mischa Jonker is
>     receiving a notification for ARC related failures.

It would be nice if it were also possible to somehow "subscribe" to a
list of packages and get a mail when any of these packages fails to
build.

For example, I'd like to catch errors in the packages I've submitted.

I see two options for this:
  - add a global MAINTAINERS file that list maintainers for each
    actively maintained packages (a bit like the Linux kernel does);
  - add a FOO_MAINTAINER variable to foo.mk (for each maintained 'foo'
    package).

Would that be possible?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
