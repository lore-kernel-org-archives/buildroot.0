From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Apr 2017 22:54:21 +0200
Subject: [Buildroot] [PATCH v5 08/34] package/kodi: bump to version
 17.1-Krypton
In-Reply-To: <dnrssdx9sb.ln2@ID-313208.user.individual.net>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-9-bernd.kuhls@t-online.de>
 <20170422202457.GJ15086@scaer>
 <dnrssdx9sb.ln2@ID-313208.user.individual.net>
Message-ID: <20170422205421.GM15086@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-22 22:40 +0200, Bernd Kuhls spake thusly:
> Am Sat, 22 Apr 2017 22:24:57 +0200 schrieb Yann E. MORIN:
> >>  package/kodi/0002-cmake-add-FindIconv.cmake.patch  |  171 +++
> > That patch to find iconv is a feature patch (add support for building
> > under uClibc). We avoid having feature patches. At best make it a
> > separate changeset.
> building Kodi 16 with uClibc is already possible, so imho it is not a 
> feature patch, instead it fixes the problem mentioned in the patch 
> description.

Maybe Kodi 16 does build with uClibc, but not Kodi 17; it is not
supported upstream, and your patch has not yet been accepted.

Now, that you call that a regression in Kodi, sure. But from our point
of view (Buildroot), what you provide is a feature patch.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
