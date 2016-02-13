From: Hajime Yamasaki Vukelic <hayavuk@gmail.com>
Date: Sat, 13 Feb 2016 11:22:06 +0100
Subject: [Buildroot] Booting from cramfs image
In-Reply-To: <20160212145006.77bfa2fa@free-electrons.com>
References: <CAJrvd8PF5qwZxm3N0b73fJ+Ea4OFMTf-1unN1uhf7FdZBivvSA@mail.gmail.com>
 <20160212145006.77bfa2fa@free-electrons.com>
Message-ID: <CAJrvd8OxrKSy2p6xEM1hdSzF4zKRXYZgW0OX2Zfk1emNu=rjpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Feb 12, 2016 at 2:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[SNIP]
> > If someone could give me pointers on how to debug or fix this, I would
> > greatly appreciate it.
>
> Well, it essentially means that your init program on your real root
> filesystem (in the cramfs image) does not work. Built for the wrong
> architecture variant, missing libraries, etc. Could be lots of things.

Ah, thanks, it hasn't occurred to me that would be the case. Is there
some way I can get useful output and maybe store it on the card for
debugging purposes?

> Also, why use a cramfs filesystem rather than the modern modern and
> efficient squashfs?

This is the first time I'm doing this type of setup, so simply lack of
experience, I guess. :)

-- Hajime
