From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 12:36:53 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAHt8ZCMG8uj2_vn=18gX0QQvte4RjO+R4OwY1jG6sEzbJUcGDA@mail.gmail.com>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <CAHt8ZCP5zMXZfPo8EFpdVCFX0zq7DvJu=GoNcYGWo=frHdFpZA@mail.gmail.com>
 <20131110114639.0d648555@skate>
 <CAHt8ZCMG8uj2_vn=18gX0QQvte4RjO+R4OwY1jG6sEzbJUcGDA@mail.gmail.com>
Message-ID: <20131110123653.13bb8d6e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Simon Dawson,

On Sun, 10 Nov 2013 11:21:14 +0000, Simon Dawson wrote:

> Unfortunately, there is no fallocate syscall on avr32. So I think I'll
> have to revert to my original plan to disable fallocate in the
> util-linux package for avr32.

Ok. I guess there will be a bunch of packages that use fallocate(), so
we'll have to mark them !BR2_avr32, or find some other trick.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
