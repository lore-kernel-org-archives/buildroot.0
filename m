From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Dec 2016 21:10:56 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build on ancient glibc
In-Reply-To: <87inqfadi3.fsf@dell.be.48ers.dk>
References: <1482168120-7386-1-git-send-email-yann.morin.1998@free.fr>
 <87inqfadi3.fsf@dell.be.48ers.dk>
Message-ID: <20161219201056.GB6153@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-12-19 21:08 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Fix build with ancient glibces.
>  > Fixes:
>  >     http://autobuild.buildroot.net/results/bce/bcecdbbce4a99eb1e9bfbf519857bf94d8952037/
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  > ---
>  >  ...onfigure-search-for-lib-with-clock_getres.patch | 47 ++++++++++++++++++++++
> 
> You forgot to add WESTON_AUTORECONF = YES. Committed with that fixed,
> thanks.

Grr.. I forgot to git-add it... :-/

Thanks for fixing.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
