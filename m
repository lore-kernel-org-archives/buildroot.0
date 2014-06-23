From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Jun 2014 18:38:45 +0200
Subject: [Buildroot] [PATCHv2 1/2] geoip: new package
In-Reply-To: <53A75D10.8050708@zacarias.com.ar>
References: <1403015963-27278-1-git-send-email-gustavo@zacarias.com.ar>
 <20140622215442.4c060328@free-electrons.com>
 <53A759EB.8090702@zacarias.com.ar> <20140622224049.GF21768@free.fr>
 <53A75D10.8050708@zacarias.com.ar>
Message-ID: <20140623163845.GA3400@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-22 19:47 -0300, Gustavo Zacarias spake thusly:
> On 06/22/2014 07:40 PM, Yann E. MORIN wrote:
> > Then would it make sense to package geoipudate instead, either or both
> > as a target and/or a host package:
> >     https://github.com/maxmind/geoipupdate
> > 
> >     The GeoIP Update program performs automatic updates of GeoIP2 and
> >     GeoIP Legacy binary databases.
> > 
> > That way, the user can get it with a post-build script, and/or a
> > cron-like job on the target, to be up-to-date.
> 
> Geoipupdate is for commercial users AFAIK, i have no such access/account
> to test the package. You need to configure a maxmind user/password to
> make it work, it's not an out-of-the-box experience.

Well, I don't see where the problem lies. There's nothing that prevents
us from packaging geoipupdate, even if it requires a runtime
configuration with a login+password.

That's basically the same as for a webserver: we do package more than
one webserver, but the user is still responsible for providing the
content of the server-root.

> Someone who has might be interested to make it though.

I agree with you on that. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
