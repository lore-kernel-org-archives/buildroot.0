From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Feb 2017 22:52:31 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
 Kodi-specific patches
In-Reply-To: <p1ujndxbuq.ln2@ID-313208.user.individual.net>
References: <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20170205212408.GC3562@free.fr>
 <i6vmmdxipi.ln2@ID-313208.user.individual.net>
 <rk5nmdxipi.ln2@ID-313208.user.individual.net>
 <20170209232937.2a071f11@free-electrons.com>
 <XnsA719AD8F76801ID313208userindividu@bernd-kuhls.de>
 <20170212135110.61e55c66@free-electrons.com>
 <XnsA71FC7BAC87A6ID313208userindividu@bernd-kuhls.de>
 <20170217185434.GB3470@free.fr>
 <p1ujndxbuq.ln2@ID-313208.user.individual.net>
Message-ID: <20170217215231.GD3470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On 2017-02-17 20:03 +0100, Bernd Kuhls spake thusly:
> Am Fri, 17 Feb 2017 19:54:34 +0100 schrieb Yann E. MORIN:
> 
> > Except that those managed by Kodi would be downloaded at configure or
> > build time, not when doing 'make source', so we could not do an off-line
> > build. That alone would warrant they be separate packages, IMHO.
> 
> 'make source' just downloaded
> 
>  https://github.com/xbmc/libdvdcss/archive/2f12236.tar.gz
>  https://github.com/xbmc/libdvdnav/archive/43b5f81.tar.gz
>  https://github.com/xbmc/libdvdread/archive/17d99db.tar.gz

That's supposing that we do patch the existing libdvd* packages with the
kodi patches.

Which I am not too fond of to start with, hence all the discussion we're
having about it...

But...

If the patched version are still compatible with the unpatched version
(i.e. it offers a superset of the API), then that could probably be
acceptable (and thus forget about that case in my previous table).

Damned, can't the Kodi folks work with upstream to add features rather
than fork? Sigh...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
