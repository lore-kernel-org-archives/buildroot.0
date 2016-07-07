From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Jul 2016 01:25:54 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160707212628.3df1cef5@free-electrons.com>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <F9C551623D2CBB4C9488801D14F864C6EE83C112@ex-mb1.corp.adtran.com>
 <20160706202005.6e2ac6c3@free-electrons.com>
 <20160707170024.GB3827@free.fr>
 <20160707212628.3df1cef5@free-electrons.com>
Message-ID: <20160707232554.GE3827@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-07 21:26 +0200, Thomas Petazzoni spake thusly:
> On Thu, 7 Jul 2016 19:00:24 +0200, Yann E. MORIN wrote:
> > But then we would probably have to do it for other packages that build
> > both a kernel module and userland stuff, no?
> > 
> > I'm not sure I like that... :-/
> > 
> > I think the best option would be to break at the linux-tools.
> Agreed.

OK, done locally, I've been a little bit side-tracked, so it is not
completely tested yet. will spin it tomorrow...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
