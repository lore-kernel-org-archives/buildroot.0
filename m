From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2016 23:28:33 +0100
Subject: [Buildroot] [PATCH v2 4/5] docs/manual: add section about patch
 licensing
In-Reply-To: <56D0CCDB.9020302@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-5-git-send-email-luca@lucaceresoli.net>
 <20160203233430.GC3428@free.fr> <56D0CCDB.9020302@lucaceresoli.net>
Message-ID: <20160226222833.GA3437@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-02-26 23:08 +0100, Luca Ceresoli spake thusly:
> On 04/02/2016 00:34, Yann E. MORIN wrote:
[...]
> > So, we still have the problem of patches that are applied to packages
> > that can be had under a non-public license, like e.g. Qt, polarssl...
> > for which there exists a proprietary alternative?
> > 
> > In my opinion, the patches we carry are only available under the FLOSS
> > license we can get them:
> > 
> >   - if we cherry-picked them from upstream, then the only license we
> >     ever had for those patches is the FLOSS license, not the proprietary
> >     one; so they can't be applied to the proprietary version of the
> >     package (but a licensee may get those patches from the licensor, and
> >     replace our patches with the ones it got from the licensor);
> > 
> >   - if we wrote them, the only solution we have is to make them public
> >     domain, or they could not be applied either (we don't know the
> >     licensing terms for that proprietary version, so we can't license
> >     them under those terms);
> 
> Why can't we license these patches under the FLOSS license they are
> publicly available under?

Ah, my bad, I was not clear.

What I meant with that second point wa that, *if* we wanted to make
those patches available for the non-FLOSS license, then we'd have had to
license them in a very liberal way, and the only real possibility would
have been public domain, as any other license, hoever permissive it may
be, could clash with the proprietary license.

Now, I am absolutely *not* advocating for that.

In fact, I've always been, and will always be, advocating for the
patches to be made available under the _publicly available_ FLOSS
license of the package they are applied to, which is the conclusion we
came to, and which we wrote in COPYING (and soon in the manual).

> Of course this implies "they can't be applied
> to the proprietary version of the package", just like you state in the
> first case. This is a limitation, but I think it is legal. Don't you
> think so?

 1- I think it is perfectly legit, yes.
 2- I do not see that as a limitation, no.
 3- I am 100% fine with that! ;-)

> >   - if we got them from somewhere else (e.g. openwrt, gentoo,
> >     alpine...), then we'd have to get the licensing terms from those
> >     providers, and I guess most of them either don't know (most
> >     probable) or would only provide them under the usual FLOSS license
> >     of that package (not knowing better than us in points 1 and 2 above).
> > 
> > So, this situation is really complex, and we can't deal with that in
> > such a simple way.
> > 
> >> They are not distributed under the Buildroot license.
> > 
> > Well, what of a patch to a GPLv2 package? It is the same license as
> > Buidlroot's license... What I mean, is that some patches might be
> > covered by the same licensing terms, but that it's not because of
> > Buildroot, but because of the package they are applied to. I'd like we
> > make that clearer...
> 
> Aaaah, yes, you're right... Well, I guess we all got what I meant, but
> indeed I wrote something ambiguous. :(

Yes, I did get your meaning, of course! ;-)

But legalese stuff is suffficiently complex that we have to be as clear
as possible when we write such stuff. In the end, I think we pretty much
covered all the bases with that blurb we've added now, no?

Thank you for working on this topic! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
