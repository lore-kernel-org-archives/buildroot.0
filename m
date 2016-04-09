From: Alex Potapenko <opotapenko@gmail.com>
Date: Sat, 9 Apr 2016 17:59:54 +0300
Subject: [Buildroot] powerpc 8548: error building eglibc toolchain
In-Reply-To: <CAF5aO=JJ6fPZRetUKsbeAYQL+tms-7NKA=jzkjaVzD08DiPBgg@mail.gmail.com>
References: <CAF5aO=JJ6fPZRetUKsbeAYQL+tms-7NKA=jzkjaVzD08DiPBgg@mail.gmail.com>
Message-ID: <CAF5aO=KTxU-JEOk44Gf3TAN2vPMRr7atAUsJgX6K5ox8QnRk4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'm trying to compile a powerpc 8548 hard-float eglibc toolchain using
> Buildroot 2016.02 (see config file attached). I'm getting this error
> when linking libc.so:
> ...

I should also note that setting BR2_POWERPC_SOFT_FLOAT=y doesn't seem
to change anything at all. Is this option ignored with SPE ABI?
