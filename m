From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Apr 2017 23:05:05 +0200
Subject: [Buildroot] [PATCH] lpppd: new package
In-Reply-To: <20170401184051.7f6c1252@free-electrons.com>
References: <20170102223824.28266-1-Stefan.Nickl@gmail.com>
 <20170401184051.7f6c1252@free-electrons.com>
Message-ID: <20170401210505.GA3663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On 2017-04-01 18:40 +0200, Thomas Petazzoni spake thusly:
> On Mon,  2 Jan 2017 23:38:24 +0100, stefan.nickl at gmail.com wrote:
> > From: Stefan Nickl <Stefan.Nickl@gmail.com>
> > 
> > After the official github repository for PPP has not seen
> > any activity for a long time, I've created a fork that
> > tries to do some modernization and shed some legacy.
> > For more info, please see https://github.com/snickl/lpppd
> > 
> > It is inteded as a drop-in replacement for the original PPP,
> > therefore I've marked it as conflicting with the existing pppd
> > package.
> > 
> > Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
> 
> I do appreciate your interest in making the pppd development active
> again. However, at this point, I don't see what is the benefit of using
> lpppd over pppd, and having two separate packages is a bit annoying.
> Therefore, I would prefer to wait for lpppd to gain some traction
> before packaging it in Buildroot.

I kind of agree with Thomas here.

lpppd is a new fork of a well-established project, so it will have to
offer enough of an edge before it can displace pppd.

However, I agree with you that there is no activity in upstream pppd.
Maybe you could talk with upstream to adopt the package instead of
forking?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
