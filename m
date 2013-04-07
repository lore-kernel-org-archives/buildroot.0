From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:22:53 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain-external: remove older
 Microblaze toolchain
In-Reply-To: <20130407221139.7cd13371@jvarch>
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365357662-25960-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130407204958.54b890fa@jvarch> <20130407205553.65f5e32c@skate>
 <20130407221139.7cd13371@jvarch>
Message-ID: <20130407222253.391be1a7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Viktorin,

On Sun, 7 Apr 2013 22:11:39 +0200, Jan Viktorin wrote:

> I am currently not able to provide a simple example that reproduces the
> situation. Very briefly, I've got a shared library 'libx.so' and an application
> 'app'. The compilation fails while linking the app with the library. The call
> __udivsi3 is located in the libx.so.

Hum, ok. It would be great to have a simple example so that we could
investigate what's going on.


> So it seems to me that it is a problem with some options passed to the linker
> (maybe) because the libc.so.6 reference is missing in the first listing. But I
> didn't find anything strange yet. It needs some more review (and more time :/)
> but for now the workaround with v2 and LD_PRELOAD is sufficient. I will return
> to that issue later. I hope it is just a silly mistake and I will be able to
> move to the 14.3 (anyway, thanks for providing it).

Ok.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
