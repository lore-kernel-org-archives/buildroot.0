From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Jun 2014 18:56:11 +0200
Subject: [Buildroot] [PATCH] package/perl-mojolicious: bump to 5.08
In-Reply-To: <53A9AA1A.3030804@mind.be>
References: <1403471757-19622-1-git-send-email-yann.morin.1998@free.fr>
 <CAB0FRstxBpfBcoyojk3j_fPhJdaVfRz2gOZXWdiCGdBviF16TQ@mail.gmail.com>
 <20140623173544.GC3400@free.fr>
 <CAB0FRsvxYB=UWssrJSThtVnC4Js6_tjrMOozhr-KPg_4eSw8JQ@mail.gmail.com>
 <53A9AA1A.3030804@mind.be>
Message-ID: <20140624165611.GD3478@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-06-24 18:40 +0200, Arnout Vandecappelle spake thusly:
> On 23/06/14 19:50, Fran?ois Perrad wrote:
> [snip]
> > I prefer that we use Backpan only the package Mojolicious. The use of
> > Backpan must stay unusual.
> 
>  Can you explain why it should stay unusual? Is Mojolicious the only package for
> which the author removes old versions? If the general policy on CPAN is not to
> remove old versions, then I agree with you, but otherwise I think backpan is a
> better option.

I initially thought it was a policy of CPAN to only keep the latest
version. But Fran?ois said it was just that particular author that had
this policy.

So, it makes sense to use BackPan only for mojolicious for now.

If it happens that more packages need to be converted over to BackPan,
then we can revisit this later on by switching everything to BackPan.
But until then, mojolicious is the only package that suffers from this
policy.

So, I agree with Fran?ois: let's keep CPAN for now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
