From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 17 Jun 2015 16:02:10 +0200
Subject: [Buildroot] Busybox build fails on raspberrypi defconfig
In-Reply-To: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
References: <CAJtjsKZ9zeYzwSkMKiAvUz50e_7L9HKbNLY8WWwz5e59=AHGSw@mail.gmail.com>
Message-ID: <CAJtjsKa9Osr3VjF6jBysCFPEKhh4c8HAHVP7FfVj07_N_B1FMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 17, 2015 at 3:27 PM, Johan Oudinet <johan.oudinet@gmail.com> wrote:
> And busybox build fails with the following error:
> include/libbb.h:87:19: fatal error: utmp.h: No such file or directory
>  # include <utmp.h>
>                    ^

Reverting from uClibc-ng to uClibc-0.9.33 fixes this error.

-- 
Johan
