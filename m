From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Apr 2017 08:26:54 +0200
Subject: [Buildroot] [PATCH] package/kodi: fix path to binary
In-Reply-To: <8687097e-0f0c-135c-df57-454ff0e60682@cartelsol.com>
References: <20170422210539.5750-1-yann.morin.1998@free.fr>
 <8687097e-0f0c-135c-df57-454ff0e60682@cartelsol.com>
Message-ID: <20170423062654.GA2819@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, All,

On 2017-04-22 23:22 +0200, Marcus Hoffmann spake thusly:
> On 22.04.2017 23:05, Yann E. MORIN wrote:
> > Since XBMC was renamed to Kodi, upstream is progressively propagating
> > the rename to directories and files, and in some cases kept a legacy
> > symlink xbmc->kodi, like /usr/lib/xbmc pointing to /usr/lib/kodi.
> > 
> > In 62165ae (package/kodi: Fix path to binary in service), the path nary
> > was changed to use the new canonical path, but the init script was eft
> 
> Another typo here 'eft'.
> 
> > out. This was not seen previously, becasue of the legacy symlink.
> > 
> > But with the adevent of Kodi 17 (Krypton), that legacy symlink is no
> 
> And here 'adevent'.

Thanks, I'll respin.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
