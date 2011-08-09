From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 9 Aug 2011 21:50:34 +0200
Subject: [Buildroot] linphone package
In-Reply-To: <87mxfiid38.fsf@macbook.be.48ers.dk>
References: <4E413EB9.6040504@fosstel.com>
 <201108092140.21886.yann.morin.1998@anciens.enib.fr>
 <87mxfiid38.fsf@macbook.be.48ers.dk>
Message-ID: <201108092150.34769.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Tuesday 09 August 2011 21:44:59 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:
>  Yann> I'm also removing it from PKG_CONF_OPT variables. Do you want a
>  Yann> single patch that removes all instances in one go, or do you want
>  Yann> one patch per package?  I'm tempted to do the latter, so we can
>  Yann> revert only those that break.
> 
> Up to you. Seems we have it in 21 files.

Sure! So, one patch per change it will be. :-)

> I'll prefer to only commit post-2011.08 though.

I'm doing it now, `cause I get a bit bored. So, systematicaly editing a
bunch of files, and just do the same thing again-and-again won't get me
more bored than I currently am... ;-]

And then, I can easily rebase later. Hopefully... :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
