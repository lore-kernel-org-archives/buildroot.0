From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 18:51:09 +0200
Subject: [Buildroot] [PATCH 12/30] package/matchbox: get rid of
 intermediate non-package matchbox
In-Reply-To: <553971E0.10102@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <3a0d878f5062e3e57decc9a2ed348a2dcef8d0b2.1429725549.git.yann.morin.1998@free.fr>
 <553971E0.10102@mind.be>
Message-ID: <20150424165109.GB4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-24 00:27 +0200, Arnout Vandecappelle spake thusly:
> On 04/22/15 20:09, Yann E. MORIN wrote:
> > Currently, the matchbox entry in the menu is a non-package entry, that
> > forcibly selects the matchbox-wm package, which is the real matchbox WM.
> > 
> > So, get rid of the current matchbox option, rename the exisiting
> > matchbox-wm to simply matchbox, so we have a real package from the
> > onset.
> > 
> > Since we're reusing the previous option for the WM package, there is no
> > need for a entry in the legacy menu.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> > ---
> [snip]
> > +# After we called a package infra, w ecan include more files
>                                        ^^
> 
>  This comment becomes redundant after the move.

Yup, I already removed that locally. Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
