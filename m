From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Jan 2019 20:36:41 +0100
Subject: [Buildroot] [PATCH 16/19] core: check unique files in the
 corresponding finalize step
In-Reply-To: <CAAXf6LVA1XOgkSGw6S=1d7+9Lxt4H-x3cJnRPn0nizu4WfQ1cw@mail.gmail.com>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
 <543d715864419720bee6d5d858cf4c2debd773f0.1546898693.git.yann.morin.1998@free.fr>
 <CAAXf6LVA1XOgkSGw6S=1d7+9Lxt4H-x3cJnRPn0nizu4WfQ1cw@mail.gmail.com>
Message-ID: <20190108193641.GA4022@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2019-01-08 16:24 +0100, Thomas De Schampheleire spake thusly:
> El lun., 7 ene. 2019 a las 23:07, Yann E. MORIN
> (<yann.morin.1998@free.fr>) escribi?:
> > So, mnove the check to the corresponding finalize steps.
[--SNIP--]
> > +.PHONY: staging-finalize
> This should be host-finalize.

Fixed.

I also did not reply to some other typoes or minor fixes, in which case
consider I agree with your comments and fixed those here. Otherwise, I'd
have bikeshedded on the list. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
