From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Apr 2015 18:35:18 +0200
Subject: [Buildroot] a philosophical question about Config.in and
 "comment" directives
In-Reply-To: <55313266.9000600@mind.be>
References: <alpine.LFD.2.11.1504170840320.7665@localhost>
 <20150417150042.GA5271@free.fr> <55313266.9000600@mind.be>
Message-ID: <20150417163518.GC5271@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-17 18:18 +0200, Arnout Vandecappelle spake thusly:
> On 17/04/15 17:00, Yann E. MORIN wrote:
> > Rovert, All,

Damn, my keyboard skills really need to be improved upon... :-/
Sorry, Robert...

> > On 2015-04-17 08:58 -0400, Robert P. J. Day spake thusly:
[--SNIP--]
> > Well, you are right that "it would make moere sense" from a theoretical
> > point of view, and that there is no functional difference. BTW, there
> > are other  such architectural options, like MMU, that we handle the same
> > way as well.

> > Just a side note: I personally find it easier to read the way we have it
> > now: having the "depends on" directly in the package dependency list
> > looks more obvious to me (but hey! I'm kind of a weirdo! ;-) 
> 
>  Well, then either your first statement that it makes more sense was not true,
> or else you don't make sense :-P

Well, I never I did make sense in my head! ;-)

Seriously: enclosing the whole file inside a big architectural
dependency does make sense at a technical level. But I don;t grok it as
easily as it is now.

I.e. a car is far safer than a motorbike from a technical point of view
(it has airbags and safety-belts, can not easily slide on its side with
driver stuck between it and the asphalt, is warm in winter and has A/C
in summer...). But I'll use my motorbike because I prefer it. ;-)

>  Note that I also think it makes more sense to have the comment at the top then
> at the bottom.

So do I. At least, we can agree on that! hehe! ;-)
 
Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
