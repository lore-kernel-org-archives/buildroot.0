From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Thu, 23 Jun 2011 11:19:06 +0700
Subject: [Buildroot] Issue with pthread_mutex_lock with external
	toolchain
In-Reply-To: <BANLkTik8Y4y2aSm9attWqM1gXWB6CMsDOQ@mail.gmail.com>
References: <BANLkTi=VZ=q7MTfyf453BAAfEqqAZ41Lpg@mail.gmail.com>
 <BANLkTi=3TYjz7BY6a-3cCZvLfm4Ynxm6xA@mail.gmail.com>
 <BANLkTik8Y4y2aSm9attWqM1gXWB6CMsDOQ@mail.gmail.com>
Message-ID: <BANLkTimsi4tUYs+iNQy+o+Zo=sscs0JKtw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/23 Daniel Nystr?m <daniel.nystrom@timeterminal.se>

> 2011/6/22 Dwi Sasongko Supriyadi <ruckuus@gmail.com>:
> > 3. External toolchain from Code Sourcery 2010.09
>
> pthread_mutex_lock is part of libc which itself is part of the
> external toolchain package. Maybe try getting in contact with
> CodeSourcery?
>

Agreed, libpthread.so and also libthread_db.so are part of the external
toolchain, I also tried to test with buildroot toolchain and there is no
difference.

Thanks for your response

--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110623/425cf400/attachment.html>
