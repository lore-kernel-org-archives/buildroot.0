From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 07 Aug 2020 06:56:39 +0200
Subject: [Buildroot] I need help to solve this error.
In-Reply-To: <CA+NfSnLwCAfAkObYVhHDERk_k06D7w=5dM5b44cQuX9zSa4GHw@mail.gmail.com>
References: <mailman.13.1596628803.136533.buildroot@busybox.net>
 <df54940149129e4a0c7e7661497c2662@umbiko.net>
 <CA+NfSnLwCAfAkObYVhHDERk_k06D7w=5dM5b44cQuX9zSa4GHw@mail.gmail.com>
Message-ID: <c9c13fe2adb849b17252234c609c03af@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 2020-08-06 14:53, User Name wrote:
> Ok, thanks. Im still trying to repain some issues.

You're welcome.

> /bin/sh: 1: cannot create include/generated/uapi/linux/.version.h.tmp:
> Permission denied

Did you download /unpack the kernel tree with a different user? Check 
and adjust owner and directory permissions.

If you integrate the kernel build into your Buildroot instance it would 
make your life easier.

Regards,
Andreas
