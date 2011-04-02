From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2011 18:37:35 +0200
Subject: [Buildroot] libdl in buildroot
In-Reply-To: <BANLkTim6UsDHCRf5tQthWsrykgzmszn3Ew@mail.gmail.com>
References: <BANLkTim6UsDHCRf5tQthWsrykgzmszn3Ew@mail.gmail.com>
Message-ID: <20110402183735.674f48d6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 2 Apr 2011 22:16:05 +0700
bao bui <buiqbao@gmail.com> wrote:

> How can i compile the libdl in buildroot? In the stagging/usr/lib
> folder, i only have the libdl.a and libdl.so, which is the sym link
> to libdl.so.0. When I compile qt 4.7.1, I got the error: undefined
> reference to `dlopen'. I think the reason of this error is the
> missing of file libdl.so.0

libdl is part of the C library.

You don't provide enough details: which toolchain are you using, which
Buildroot version are you using, which Buildroot configuration are you
using, which exact error messages do you get.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
