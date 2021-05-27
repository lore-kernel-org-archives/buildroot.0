From: Andreas Hilse <andreas.hilse@googlemail.com>
Date: Thu, 27 May 2021 17:33:39 +0200
Subject: [Buildroot] [Bug 13586] New: grub failure with BR2_OPTIMIZE_3
In-Reply-To: <bug-13586-163@https.bugs.busybox.net/>
References: <bug-13586-163@https.bugs.busybox.net/>
Message-ID: <CANabuZcix3uT0SwKotJoPBAu6WvZ_SVQ99y=navBARH=GRKZ9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

following up on this because I also encountered this error.

There is a bug report on the grub bug tracker by Tony Battersby who
bisected the error down to a certain patch/bugfix:
https://savannah.gnu.org/bugs/?60458

The mentioned patch has also been included in buildroot as
boot/grub2/0132-kern-parser-Fix-a-stack-buffer-overflow.patch with
commit e840f2d469.

I can also confirm, that removing that patch fixes the issue of grub
loop of endless rebooting.

Best regards
Andreas Hilse
