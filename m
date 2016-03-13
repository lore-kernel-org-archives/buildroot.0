From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Mar 2016 21:47:30 +0100
Subject: [Buildroot] [PATCH] slang: make install-static do
	install-pkgconfig
In-Reply-To: <87fuvuf6qa.fsf@dell.be.48ers.dk>
References: <1457838391-19605-1-git-send-email-jcmvbkbc@gmail.com>
 <87mvq2gmo4.fsf@dell.be.48ers.dk> <20160313202028.GA3488@free.fr>
 <87fuvuf6qa.fsf@dell.be.48ers.dk>
Message-ID: <20160313204730.GC3488@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-03-13 21:44 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
> Hi,
> 
>  >> Patch description and signed-off-by missing. Alternatively we can drop
>  >> the patch and just pass install-pkgconfig to the 'make install' step as
>  >> we already need to use a custom make target anyway.
> 
>  > That's what Max did in his first patch, and I asked him to do it in our
>  > patch.
>  > The .pc file is not installed for static-only because *we* added a patch
>  > that breaks down install into install-staging and install-shared.
> 
> But that patch is an upstream patch:
> 
> Repository: git://git.jedsoft.org/git/slang.git
> Commit ID: 3796db6fb94a2fc7fe2fb0b6918501b69a4d3a02
> Author: John E. Davis <jed@jedsoft.org>

Oh...

> So just changing what the patch does without updating the comment is
> imho not the right way to go. We should instead add a 0003 patch and
> send it upstream.

Definitely.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
