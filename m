From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 09:33:14 +0200
Subject: [Buildroot] [PATCH 4/5] portaudio: add license information
In-Reply-To: <20130523070918.GG25186@sapphire.tkos.co.il>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-4-git-send-email-gilles.talis@gmail.com>
 <20130523065904.GD3373@free.fr>
 <20130523070918.GG25186@sapphire.tkos.co.il>
Message-ID: <20130523073314.GE3373@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2013-05-23 10:09 +0300, Baruch Siach spake thusly:
> On Thu, May 23, 2013 at 08:59:04AM +0200, Yann E. MORIN wrote:
[--SNIP--]
> > This is not really MIT, since there is additional text:
> > 
> >  ---8<---
> >  * The text above constitutes the entire PortAudio license; however, 
> >  * the PortAudio community also makes the following non-binding
> >  * requests:
> >  *
> >  * Any person wishing to distribute modifications to the Software is
> >  * requested to send the modifications to the original developer so that
> >  * they can be incorporated into the canonical version. It is also 
> >  * requested that these non-binding requests be included along with the 
> >  * license above.
> >  ---8<---
> > 
> > So I'd say:
> >     PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
> > 
> > (which by the way makes it non-free software.)
> 
> Well, the text you cite says explicitly that these are "non-binding requests".  
> Would you still consider this non-free?

Well, I poundered that, yes. But the way it is phrased is dubious.

First, it states that it is a non-binding clause. But then the clause
states "[a]ny person [doing changes] is requested to send modifications
[upstream]." The term "requested" is a bit strong for a non-binding
clause.

So, let me rephrase:
    (which by the way *may* make it non-free software.)

But the final word should come from a legal counsel, of course. :-)

Anyway, this is not "MIT" per-se.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
