From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Jan 2021 11:38:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/sysklogd: bump to version
 2.1.2
In-Reply-To: <CANabuZdyTY9tOdXqAiW4bjvOK=RDYW2MZvzw5eMQ-iCiYpQZFQ@mail.gmail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
 <20201229181125.704233-1-andreas.hilse@googlemail.com>
 <87turgy8vi.fsf@gmail.com> <20210119222636.42b6121a@windsurf.home>
 <CANabuZdyTY9tOdXqAiW4bjvOK=RDYW2MZvzw5eMQ-iCiYpQZFQ@mail.gmail.com>
Message-ID: <20210120113811.08f7e90f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Jan 2021 11:11:30 +0100
Andreas Hilse <andreas.hilse@googlemail.com> wrote:

> The issue I had with the logger tool is that the base dir for sysklogd
> (exec-prefix) is /, thus it is placed in /bin. The busybox logger is
> placed in /usr/bin so I ended up with both in my rootfs.
> 
> To make this work sysklogd exec-prefix should be /usr - which implies
> additional changes in the package files.
> Would this be ok?

Yes, it's certainly OK to change sysklogd.mk as necessary.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
