From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 21:44:06 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-23
In-Reply-To: <20140224213718.4ae77597@skate>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
 <877g8kn6qf.fsf@dell.be.48ers.dk>
 <CAAXf6LX0eoYHR7PUb8MvZdJFiQN29Tt8CBf8iFqY8wFa3FFetw@mail.gmail.com>
 <20140224213718.4ae77597@skate>
Message-ID: <20140224204406.GA11504@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-02-24 21:37 +0100, Thomas Petazzoni spake thusly:
> On Mon, 24 Feb 2014 12:37:11 +0100, Thomas De Schampheleire wrote:
> 
> > > Yes, but that relies on the TOOLCHAIN_HEADERS_AT_LEAST_x stuff. Do we
> > > want that for 2014.02?
> > 
> > It may be very short before the deadline for a patch series like this,
> > but if you ask me, I would dare to apply it still.
> 
> Even though I really believe the patch series is good, I don't think it
> should be applied now. We're 4 days before the end of the month, and
> therefore before the release. It is too risky to apply such a patch
> series now. I'm fine with adding more autobuilder exceptions for now,
> until Yann series is merged after the release.

Agreed, I was not even trying to push it for 2014.02. It should be
applied only after the release is made.

Even if we all were confident there would be no issue (which is not the
case, fir sure), this is too invasive a change to be applied so late in
the -rc phase.

But thanks for the trust you have in me. Muhahaha! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
