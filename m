From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2011 14:12:16 +0200
Subject: [Buildroot] UDEV-172 problems, buildroot 2011.08, linux 2.6.33
In-Reply-To: <CAMeaXtxK=Hf3MMSbJK+nHp8UZnFgkAEkef2n5CkwgaitNxvVYQ@mail.gmail.com>
References: <CAMeaXtxK=Hf3MMSbJK+nHp8UZnFgkAEkef2n5CkwgaitNxvVYQ@mail.gmail.com>
Message-ID: <20111029141216.1efbddac@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 29 Oct 2011 13:25:44 +0200,
Robin Theunis <robint91@gmail.com> a ?crit :

> I have a small problem with udev-172. It fails to build with
> buildroot. The target is a custom AT91RM9200 board, the kernel is
> 2.6.33. Everything has OABI support.
> Has someone an idea what is happening?

Yes, 2.6.33 is too old to build a modern udev such as udev 172.
Probably it can be workaround at udev level, I don't know how
complicated it would be, though.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
