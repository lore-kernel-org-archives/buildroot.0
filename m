From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Oct 2014 18:43:58 +0200
Subject: [Buildroot] [RFC 3/3] package/kodi: Bump version to 14.0a4-Helix
In-Reply-To: <1412439081-2975-4-git-send-email-bernd.kuhls@t-online.de>
References: <1412439081-2975-1-git-send-email-bernd.kuhls@t-online.de>
 <1412439081-2975-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141004164357.GC3990@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-04 18:11 +0200, Bernd Kuhls spake thusly:
> - add kodi/xbmc specific patches for ffmpeg from OpenELEC

NAK, those patches are against ffmpeg, not Kodi. They should be provided
in a separate changeset.

Also, there are quite a few patches bundled in that single biggish patch.
I'd prefer if they were provided as multiple patches, instead. It is
easier to review.

Also, the commit log for that biggish patch says:
    ffmpeg: update XBMC upstream patches

Does that mean those patches come from upstream XBMC/Kodi? If so, I'd
prefer a pointer to upstream XBMC/Kodi, rather than a pointer to a patch
bundle from a third party project.

> - add dependency to ffmpeg, xbmc does not deliver its own ffmpeg anymore

Woot! Yeah! *That* is good news! :-)

> - remove dependency to lame, audio encoders have been seperated from kodi

In what way? Does it now rely on ffmpeg instead?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
