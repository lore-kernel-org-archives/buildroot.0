From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Mar 2014 19:05:29 +0100
Subject: [Buildroot] [PATCH v4 1/5] mesa3d: pull out from x11
In-Reply-To: <eoa1vaxos4.ln2@ID-313208.user.individual.net>
References: <BLU0-SMTP4083C56CA0B43BBAC9B3616D9750@phx.gbl>
 <20140310173941.GA3282@free.fr>
 <eoa1vaxos4.ln2@ID-313208.user.individual.net>
Message-ID: <20140310180528.GB3282@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-03-10 18:52 +0100, Bernd Kuhls spake thusly:
> Hi,
> 
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140310173941.GA3282 at free.fr: 
> 
> > Maybe it would be nice to give in the commit log a bit more details on
> > why it makes sense to move it out of x11r7.
> 
> mesa3d does not depend on x11, it can be used by wayland as well.

Just add this in the commit log. ;-)

> > If I understand correctly, mesa3d is an implementation of OpenGL. So,
> > *maybe* it would make sense to move it along the other OpenGL packages,
> > into package/opengl/.
> 
> In package/opengl/ are only virtual packages.

Right. Mesa3D is more on the provider-side, indeed. So no need to put it
in package/opengl. OK. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
