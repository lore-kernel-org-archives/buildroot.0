From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 09:18:24 +0200
Subject: [Buildroot] [PATCH] package: libcgi: set upstream to
 https://github.com/rafaelsteil/libcgi
In-Reply-To: <CAKKQwLRvWC34J-vJwuB2WO1m8a1UWLCukf8X+dOyUT0KAxtfkA@mail.gmail.com>
References: <20170512221546.20280-1-mrugiero@gmail.com>
 <20170513145922.5e2626c5@free-electrons.com>
 <CAKKQwLRvWC34J-vJwuB2WO1m8a1UWLCukf8X+dOyUT0KAxtfkA@mail.gmail.com>
Message-ID: <20170514091824.44804439@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 01:24:10 -0300, Mario Rugiero wrote:

> That's right, I should've checked.
> There's an upstream computed sha256sum though, shouldn't that be in use?

Yes, if there's one, it's better if it's used. Perhaps something you
could comment on the original patch, and I can fixup when applying.

Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
