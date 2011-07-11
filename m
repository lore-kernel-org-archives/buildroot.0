From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 11 Jul 2011 17:26:44 +0000
Subject: [Buildroot] tmpfs puzzle
In-Reply-To: <CALo-6+iVEYuZm=Tr9opt-VOz+4ZqnGQJ8LbD-tV-dEojfdXMMA@mail.gmail.com>
References: <CALo-6+iVEYuZm=Tr9opt-VOz+4ZqnGQJ8LbD-tV-dEojfdXMMA@mail.gmail.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C603FFC5@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I am puzzled why "tmpfs" is not mounting in my buildroot glibc root
> filesystem and would appreciate a "clue" or at least a sarcastic
> "RTFM" if one could tell me *which* "FM" and what its URL might be.

Guessing that you don't have tmpfs enabled in the kernel in BOTH
places.

Good luck!

Andy
