From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Sep 2016 23:14:44 +0200
Subject: [Buildroot] [PATCH 00/16 v3] br2-external: support multiple
 trees at once (branch yem/multi-br2-external-ID-7)
In-Reply-To: <877farwlpn.fsf@dell.be.48ers.dk>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <eda2b290-992f-7a26-424b-f522b7a805ae@mind.be>
 <874m611n1e.fsf@dell.be.48ers.dk>
 <20160831091443.691ffd1c@free-electrons.com>
 <20160831092643.GA5549@free.fr>
 <e47d26b6-26a6-ac0a-8334-b9a0785084f4@mind.be>
 <877farwlpn.fsf@dell.be.48ers.dk>
Message-ID: <20160904211444.GB6522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-09-04 20:42 +0200, Peter Korsgaard spake thusly:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>  >  One remark though: we should really document such backward compatibility
>  > issues. I don't think we're currently doing that well.
> 
>  >  Where should this be done?
> 
>  > - In CHANGES? At the moment, however, the CHANGES file is not really inviting to
>  > look for that kind of thing. Especially because users will often upgrade in
>  > jumps of 4 or more releases - that makes up 900 lines of CHANGES text...
> 
> Do you still think this is an issue? It is natually still big, but I do
> find that readability has improved quite a bit since I removed the
> Updated/fixed packages list for -rc1. I currently still add it for later
> rc's, but we could drop that as well if people prefer.
> 
>  > - In the manual? There isn't really an appropriate place for it at the moment.
>  > And how long do we keep it there?
> 
>  > - In some new location? Where?
> 
>  >  My personal preference would be in the manual, and keep it for a couple of years.
> 
> I think we should add it to CHANGES, and add a short notice in the
> manual that earlier BR versions used a different br2-external setup.

Already done, and will be part of the next iteration:
    https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/multi-br2-external-10&id=1eb85fca3b3363057a5e6662fd5af7c529593af4

This adds three things:
  - an appendix on how to convert, with Arnout's suggestion,
  - an xref in the br2-external section to point to that appendix,
  - a pointer to that appendix in the error message.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
