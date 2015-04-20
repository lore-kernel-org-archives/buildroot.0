From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2015 23:24:22 +0200
Subject: [Buildroot] [PATCH v6 5/8] support/download: add possibility to
 not fail on missing hash
In-Reply-To: <5534AEA2.9010401@mind.be>
References: <cover.1429447148.git.yann.morin.1998@free.fr>
 <1429466158-28878-1-git-send-email-arnout@mind.be>
 <1429466158-28878-5-git-send-email-arnout@mind.be>
 <20150419183851.GM4313@free.fr> <5534AEA2.9010401@mind.be>
Message-ID: <20150420212422.GC4057@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-20 09:45 +0200, Arnout Vandecappelle spake thusly:
> On 19/04/15 20:38, Yann E. MORIN wrote:
[--SNIP--]
> >> >From the Makefile, we export the list of files for which not to check
> > 
> > Stray leading '>' probably for a copy-paste from your mailer.
> 
>  pwclient git-am actually... I would have expected patchwork (or actually, the
> python mail handling infra) to handle >From correctly...

Actually, that comes from RFC 4155.
    https://tools.ietf.org/html/rfc4155

TL;DR: "From " is actually used in mbox format to define the begining
of an email. Thus, any lines in a body, that begins thusly, must be
"quoted" to avoid improperly detecting the begining of an email.

See also this mail in the Patchwork ML archives:
    https://lists.ozlabs.org/pipermail/patchwork/2014-November/001218.html

I don't think this was ever applied...

[--SNIP--]
> > I don't like much the escaping when it can be avoided. We can still use
> > quotes (even if not very much better), like so:
> > 
> >     *" ${base} "*
> 
>  It's your patch, modify as you like :-)

Hehe! :-)

>  I just reposted it since I anyway had it locally modified.

Yeah, thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
