From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Jan 2013 21:45:35 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <CAGduivwy0n=E6KqapcD1ie7i58mBTa6xU7gNBKmF35C9yb0N8A@mail.gmail.com>
References: <cover.1357426077.git.maxime.hadjinlian@gmail.com>
 <323f2db72c57aff2b31b2b7a5eb7f06d74775eda.1357426077.git.maxime.hadjinlian@gmail.com>
 <20130106212655.78c04f0d@skate>
 <CAGduivwy0n=E6KqapcD1ie7i58mBTa6xU7gNBKmF35C9yb0N8A@mail.gmail.com>
Message-ID: <20130106214535.33adf615@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 6 Jan 2013 21:39:55 +0100, Maxime Hadjinlian wrote:

> > LIBCOFI_LICENSE ?
> There is absolutely no information whatsoever about license that I
> could find, so I really did knew what to put there.

There is actually a lot of information about the license in the
README.md file:

The inner loop of the misalignment path of memcpy is derived from the
GNU libc ARM port. As a result "copies-and-fills" is licensed under the
GNU Lesser General Public License version 2.1. See
http://www.gnu.org/licenses/ for details. To see the original memcpy,
browse it here:
http://sourceware.org/git/?p=glibc-ports.git;a=blob;f=sysdeps/arm/memcpy.S;hb=HEAD

So:
	LIBCOFI_LICENSE = LGPLv2.1
	LIBCOFI_LICENSE_FILES = README.md

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
