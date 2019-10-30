From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Oct 2019 23:21:17 +0100
Subject: [Buildroot] [PATCH] core/web-legal-info: Generate html page
 with minimal legal info
In-Reply-To: <e39aac32-a53c-0b21-c980-07c50d1bdc00@mind.be>
References: <20191029095101.442578-1-mickael.tansorier@smile.fr>
 <6970e379-2cd8-fc37-7a24-f4976e9962c1@mind.be>
 <20191030090924.GB2604@scaer>
 <e39aac32-a53c-0b21-c980-07c50d1bdc00@mind.be>
Message-ID: <20191030222117.GA5289@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-10-30 11:19 +0100, Arnout Vandecappelle spake thusly:
> On 30/10/2019 10:09, Yann E. MORIN wrote:
> >      * python (version 2.7 or any later)
>  The problem is: I would like to have some autobuilders without installed
> python. Since the autobuilders do run legal-info, that would not be possible...

Didn't we also conclude that, given that the autobuild scripts are
witten in python, it is thus forcibly present on an autobuilder
instance?

> > Also, have you had a look at Nicolas' alternate proposal, which is much
> > more lightweight and simple:
> >     http://lists.busybox.net/pipermail/buildroot/2019-October/264344.html
>  Note that that patch is missing a documentation update (which could be done in
> a separate patch).

And did not actually work for me, so might need refinement, or maybe I
was missing a few pre-requisites... Needs investigations

> > Such copyright identifiers are not required: the Berne Convention states
> > that the copyright is implicit, that is, a work does not have to carry a
> > copyright identifier to be properly copyrighted [https://en.wikipedia.org/wiki/Berne_Convention].
> 
>  However, all open source licenses (GPL, BSD, MIT, ...) kind of require it,
> because they require to mention the authors. Some projects (e.g. CMake) keep an
> explicit list of authors in the top-level LICENSE file. Other projects just say
> "the FOO contributors". Oh, and REUSE [1] requires it as well. And finally:
> (almost?) all our existing scripts do have a copyright line.

Which is sad, because it is definitely not exhaustive, far from it,
while the git log is.

> > Also, as time passes, other contributors will modify this script. We do
> > not want to have a copyright identifier for each and every contribution
> > that will be made to this script. Especially since the git log keeps an
> > accurate authorship of all contributors.
> > 
> > So I would suggest we do add such new copyright identifiers, and get rid
> > of the existing ones (as time passes).
> 
>  We should decide on a convention and stick to it :-)

Hey, I indeed meant "we should _not_ add any more". ;-)

But if the trend in the licensing galaxy is to require them, that's a
shame that we have to abide to this limitation, when we have better
technical solutions... :-(

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> > 
> > Regards,
> > Yann E. MORIN.
> 
> [1] https://reuse.software/
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
