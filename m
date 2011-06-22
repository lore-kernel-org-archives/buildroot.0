From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 22 Jun 2011 21:53:39 +0200
Subject: [Buildroot] Issue with pthread_mutex_lock with external
	toolchain
In-Reply-To: <BANLkTi=3TYjz7BY6a-3cCZvLfm4Ynxm6xA@mail.gmail.com>
References: <BANLkTi=VZ=q7MTfyf453BAAfEqqAZ41Lpg@mail.gmail.com>
 <BANLkTi=3TYjz7BY6a-3cCZvLfm4Ynxm6xA@mail.gmail.com>
Message-ID: <BANLkTik8Y4y2aSm9attWqM1gXWB6CMsDOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/6/22 Dwi Sasongko Supriyadi <ruckuus@gmail.com>:
> 3. External toolchain from Code Sourcery 2010.09

pthread_mutex_lock is part of libc which itself is part of the
external toolchain package. Maybe try getting in contact with
CodeSourcery?
