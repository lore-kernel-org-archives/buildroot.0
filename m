From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 10 Nov 2013 11:21:14 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131110114639.0d648555@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <CAHt8ZCP5zMXZfPo8EFpdVCFX0zq7DvJu=GoNcYGWo=frHdFpZA@mail.gmail.com>
 <20131110114639.0d648555@skate>
Message-ID: <CAHt8ZCMG8uj2_vn=18gX0QQvte4RjO+R4OwY1jG6sEzbJUcGDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10 November 2013 10:46, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Sun, 10 Nov 2013 10:32:29 +0000, Simon Dawson wrote:
>> Yes, I'm working on backporting fallocate support to 0.9.31 now.
>
> Great.

Unfortunately, there is no fallocate syscall on avr32. So I think I'll
have to revert to my original plan to disable fallocate in the
util-linux package for avr32.

Simon.
