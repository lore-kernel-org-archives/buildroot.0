From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Sep 2014 22:17:26 +0200
Subject: [Buildroot] [PATCH 12/23 v5] docs/manual: last pass at removing
 hard-coded path in GENDOC_INNER
In-Reply-To: <CAAXf6LXVFn4Fvbceoy+Mvcsms9s4LXtpRwxWrxLsjZgZ34LVCw@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <661d747642ce1e9ca884829b0a295faf35933209.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LUbrYHqCReJLRMRf4jfRGfH=0C=-TwYd2foZjpzzYonCw@mail.gmail.com>
 <20140923172106.GA4283@free.fr>
 <CAAXf6LXVFn4Fvbceoy+Mvcsms9s4LXtpRwxWrxLsjZgZ34LVCw@mail.gmail.com>
Message-ID: <20140924201726.GB3750@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, Samuel, All,

On 2014-09-24 08:54 +0200, Thomas De Schampheleire spake thusly:
> On Tue, Sep 23, 2014 at 7:21 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > I agree. But then, where should we move it?
> >
> >   - keep it in docs/manual/ ? That would imply it is specific to our
> >     manual.
> >
> >   - move it in docs/ ? But docs/ contains our website.
> >
> >   - keep docs/manual, move the website to docs/website/ ? This way we
> >     could move the asciidoc*.conf into docs/ and is IMHO much cleaner
> >     than we have today.
> 
> I think this proposal is better than the first two. The layout would be
> 
> docs/
>      asciidoc setting files
>      website/
>      manual/

As Peter (on IRC), Samuel, you and I all prefer this layout, I'm going
with that. In fact, I already have the patches moving the website ready
for submission. But I'll do in a separate series, so it is easier to
handle.

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
