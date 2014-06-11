From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 20:06:56 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/mesa3d: depend on udev
In-Reply-To: <20140611200020.352797b8@free-electrons.com>
References: <1402508508-437-1-git-send-email-bernd.kuhls@t-online.de>
 <1402508508-437-4-git-send-email-bernd.kuhls@t-online.de>
 <20140611175236.GC3472@free.fr>
 <20140611200020.352797b8@free-electrons.com>
Message-ID: <20140611180656.GE3472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-11 20:00 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 11 Jun 2014 19:52:36 +0200, Yann E. MORIN wrote:
> 
> > This is a stop-gap fix until we have a proper libudev package.
> > This shoudl be independent from the previous patches, so can go in
> > as-is:
> 
> Then why was it sent as the last patch of the series?

Because Bernd changed the meaning of _HAS_UDEV to mean "has a libudev".

But since that's not what we want, but we need a quick fix, we can still
apply that patch as-is to quickly stop the build-failure bleeding in the
autobuilders.

Then (later!), when we have settled on this libudev thinggy, we can
switch mesa to use the new libudev.

But in the mean time, this patch still applies and still makes sense
without the rest of the series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
