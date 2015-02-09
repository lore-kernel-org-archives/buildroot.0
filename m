From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Feb 2015 22:26:24 +0100
Subject: [Buildroot] Buildroot 2015.02-rc1 released
In-Reply-To: <20150209212325.GA4309@free.fr>
References: <87zj8o3xi9.fsf@dell.be.48ers.dk>
 <CAB0FRstnC8f2b9VqRbomGNPx_2LacDZDQvjveAR_MCkBT-=G8w@mail.gmail.com>
 <20150209212325.GA4309@free.fr>
Message-ID: <20150209212624.GB4309@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2015-02-09 22:23 +0100, Yann E. MORIN spake thusly:
> On 2015-02-09 20:59 +0100, Fran?ois Perrad spake thusly:
> > 2015-02-08 22:26 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:
> > > http://buildroot.net/downloads/buildroot-2015.02-rc1.tar.gz
> > 
> > This tarball contains a symbolic link (docs/images -> docs/website/images).
> > I don't know if it's useful, but it is unusual.
> 
> Yes, it is needed for the manual.
> 
> The manual and the website share the same images, so we want to share
> them rather than dupliacte them.
> 
> However, I did not find a satisfactory solution except for the symlink.

Hmmm... I had a quick look, and the "cleanup" might not be that complex.
Stay tuned! ;-)

Thanks for the report!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
