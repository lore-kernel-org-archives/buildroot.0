From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 11:03:58 +0100
Subject: [Buildroot] autobuild: wget getid error using br-reproduce-build
In-Reply-To: <CAHkwnC9YcaDKO75wM__BgeG34Pdnj_oWEGD3n1BTge90tB2v2g@mail.gmail.com>
References: <CAHkwnC9YcaDKO75wM__BgeG34Pdnj_oWEGD3n1BTge90tB2v2g@mail.gmail.com>
Message-ID: <20150214100358.GC3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-02-14 10:53 +0100, Fabio Porcedda spake thusly:
> I'm tying to use the br-reproduce-build script to reproduce autobuild
> errors, but the script fail when it download the getid file, eg:
> wget http://autobuild.buildroot.org/results/d0d4618937af10ee675e84c86b13b0d48050fe47/gitid
> 
> The problem is that the url
> http://autobuild.buildroot.org/results/d0d4618937af10ee675e84c86b13b0d48050fe47/gitid
> does not show the "gitid" file but it redirect to:
>  http://autobuild.buildroot.net/results/d0d/d0d4618937af10ee675e84c86b13b0d48050fe47//
> 
> To be able to download the getid file i must use:
> wget http://autobuild.buildroot.net/results/d0d/d0d4618937af10ee675e84c86b13b0d48050fe47//gitid
> 
> Is this behavior expected, so the script must be changed? Or it is a
> web site related problem?

I can reproduce, indeed.

I'll try to have a look at that (plus I have quite a few improvements to
do in that script anyway...).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
