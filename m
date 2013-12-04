From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 22:31:16 +0100
Subject: [Buildroot] [PATCH v3] package/tvheadend: unbreak
In-Reply-To: <20131204084524.1227d22c@skate>
References: <1386115721-24113-1-git-send-email-yann.morin.1998@free.fr>
 <20131204084524.1227d22c@skate>
Message-ID: <20131204213114.GB3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-04 08:45 +0100, Thomas Petazzoni spake thusly:
> On Wed,  4 Dec 2013 01:08:41 +0100, Yann E. MORIN wrote:
> 
> > diff --git a/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> > new file mode 100644
> > index 0000000..caa6e2a
> > --- /dev/null
> > +++ b/package/tvheadend/tvheadend-004-dont-run-compiled-code.patch
> > @@ -0,0 +1,21 @@
> > +support: don't try to run compiled code
> > +
> > +When cross-compiling, we can't run the compiled code.
> > +
> > +Consider the compiler besing successfull as an indication
> > +it is working.
> 
> What does "the compiler being successful" means?

It means we are content with the compiler being able to compile.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
