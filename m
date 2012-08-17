From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2012 15:37:53 +0200
Subject: [Buildroot] [PATCH 06/36] package/usbredir: new package
In-Reply-To: <20120817131558.77a46760@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-6-git-send-email-yann.morin.1998@free.fr>
 <20120817131558.77a46760@skate>
Message-ID: <201208171537.54259.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 17 August 2012 13:15:58 Thomas Petazzoni wrote:
> Le Mon, 13 Aug 2012 01:53:54 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > +# Note: do not ofrget to update the license, above, if you keep the server.
> 
> forget

Hehe! :-)

> Otherwise, looks good.
> 
> Another note: have you looked at the uClibc compatibility of all these
> new packages, regarding things like wchar, locale, largefile, ipv6 and
> al. ?

I'm building with uClibc, but granted, that's a full-featured config.

I'll test further with a stripped-down config to see what's missing.

I at least know of one of the packages that requires SSP in the libc, but I
think there's no such knob in BR for now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
