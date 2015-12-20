From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Dec 2015 15:47:59 +0100
Subject: [Buildroot] RFC: Patch series for Kodi 16-Jarvis
In-Reply-To: <20151220141613.22b22bdc@free-electrons.com>
References: <3sigkcxlsq.ln2@ID-313208.user.individual.net>
 <vjiikcxh6u.ln2@ID-313208.user.individual.net>
 <20151220135412.652a8344@free-electrons.com>
 <20151220130054.GC3677@free.fr>
 <20151220141613.22b22bdc@free-electrons.com>
Message-ID: <20151220144759.GD3677@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-20 14:16 +0100, Thomas Petazzoni spake thusly:
> On Sun, 20 Dec 2015 14:00:54 +0100, Yann E. MORIN wrote:
> > Well, I'm not too fond of that. But indeed, it's a pain to review either
> > way.
> > 
> > Maybe a middle-ground solution would be to bump all the screensavers in
> > one patch, all the audiocoders in a second one and so on?
> 
> I'm fine with this, but I'd like to keep my request to have the "simple
> bumps" grouped together in certain commits, but as soon as the bump is
> not just a mechanical one, it should be a separate patch. I.e for
> example:
> 
> 	kodi-screensaver-*: mechanical bumps
> 	kodi-screensaver-baz: bump version

Yes, agreed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
