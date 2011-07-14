From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 14 Jul 2011 13:24:39 +0100
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc
 versions
In-Reply-To: <CAAu5YTYMPwyV_TPx+AsnSWecaQEuxzn2yGSN1pTfLfXfg=hWYA@mail.gmail.com>
References: <CAAu5YTYMPwyV_TPx+AsnSWecaQEuxzn2yGSN1pTfLfXfg=hWYA@mail.gmail.com>
Message-ID: <1310646286.2189.43.camel@dublxciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-07-14 at 11:38 +0100, Quotient Remainder wrote:
> 
> On 14 I?il 2011 11:29, "Peter Korsgaard" <jacmet@uclibc.org> wrote:
> 
> >  Sven> linux/linux.mk:26: *** Recursive variable `LINUX_SITE'
> references itself
> ...
> > I think we can simply replace one of the '=' with a := to break the
> > loop, but would like to be able to reproduce it first.
> 
> Or += if you want to avoid :=.

Of course I'm talking rubbish.  += will add an unwanted space between
the parts.
