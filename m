From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Aug 2012 15:38:42 +0200
Subject: [Buildroot] [PATCH 10/36] package/spice-server: new package
In-Reply-To: <20120817132218.40c4d82d@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-10-git-send-email-yann.morin.1998@free.fr>
 <20120817132218.40c4d82d@skate>
Message-ID: <201208171538.42384.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Friday 17 August 2012 13:22:18 Thomas Petazzoni wrote:
> Le Mon, 13 Aug 2012 01:53:58 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > --- /dev/null
> > +++ b/package/spice/Config.in
> > @@ -0,0 +1,22 @@
> > +config BR2_PACKAGE_SPICE
> > +	bool "spice server"
> > +	depends on BR2_PACKAGE_PYTHON_PYPARSING
> 
> This should probably be:
> 
> 	depends on BR2_PACKAGE_PYTHON
> 	select BR2_PACKAGE_PYTHON_PYPARSING

Ok, will do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
