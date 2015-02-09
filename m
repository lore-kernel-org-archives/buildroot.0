From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Feb 2015 22:23:25 +0100
Subject: [Buildroot] Buildroot 2015.02-rc1 released
In-Reply-To: <CAB0FRstnC8f2b9VqRbomGNPx_2LacDZDQvjveAR_MCkBT-=G8w@mail.gmail.com>
References: <87zj8o3xi9.fsf@dell.be.48ers.dk>
 <CAB0FRstnC8f2b9VqRbomGNPx_2LacDZDQvjveAR_MCkBT-=G8w@mail.gmail.com>
Message-ID: <20150209212325.GA4309@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2015-02-09 20:59 +0100, Fran?ois Perrad spake thusly:
> 2015-02-08 22:26 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
> > Hi,
> >
> > Buildroot 2015.02-rc1 is released - Go download it at:
> >
> > http://buildroot.net/downloads/buildroot-2015.02-rc1.tar.gz
> >
> 
> This tarball contains a symbolic link (docs/images -> docs/website/images).
> I don't know if it's useful, but it is unusual.

Yes, it is needed for the manual.

The manual and the website share the same images, so we want to share
them rather than dupliacte them.

However, I did not find a satisfactory solution except for the symlink.
But I'll try to revisit this.

Until then, the symlink is on purpose.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
