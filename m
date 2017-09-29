From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Sep 2017 16:04:05 +0200
Subject: [Buildroot] [PATCH] package/flex: really disable flex program
In-Reply-To: <20170929154902.058b9a48@windsurf.lan>
References: <20170929134709.24221-1-yann.morin.1998@free.fr>
 <20170929154902.058b9a48@windsurf.lan>
Message-ID: <20170929140405.GH2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-09-29 15:49 +0200, Thomas Petazzoni spake thusly:
> Hello,
> 
> On Fri, 29 Sep 2017 15:47:09 +0200, Yann E. MORIN wrote:
> 
> > diff --git a/package/flex/0003-build-never-build-the-flex-program.patch b/package/flex/0003-build-never-build-the-flex-program.patch
> > new file mode 100644
> > index 0000000000..550df179c9
> > --- /dev/null
> > +++ b/package/flex/0003-build-never-build-the-flex-program.patch
> > @@ -0,0 +1,42 @@
> > +From 097a4408b83a0bf8c584bbe4fe0239581b183732 Mon Sep 17 00:00:00 2001
> > +From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +Date: Fri, 29 Sep 2017 15:41:14 +0200
> > +Subject: [PATCH] build: never build the flex program
> 
> This will also disable the build of flex the program in host-flex,
> which is not good: we want host-flex to install the flex program.

Right, I missed that in turn.

I guess I'll have to early-port your flex patch instead... Sigh...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
