From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 20 Jan 2016 13:37:56 -0800
Subject: [Buildroot] [PATCH 2/3] defconfigs: use the new
 headers-version-same-as-kernel-version option
In-Reply-To: <87powwrlbr.fsf@dell.be.48ers.dk>
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <811e1f5fe52c239010c412ce9f22b307d115cfcf.1453314776.git.yann.morin.1998@free.fr>
 <20160120213824.686c94fb@free-electrons.com>
 <87powwrlbr.fsf@dell.be.48ers.dk>
Message-ID: <CAJJ6jxtuOqfdTsbgcbwP1+y5yuLGFi-Ny5=_96kMhaWpSN5uvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can we still have different header and kernel versions?

As I understand it we have to rebuild the toolchain when we change
header versions. So if I have a working embedded system based on
kernel x and am trying to get a new one working with kernel x+1, I
really don't want to change the kernel header version. In this case
they should be backward compatible. And rebuilding the toolchain is
such a pain that I always use an external toolchain, even if using the
buildroot internal built one.

So as long as I can still have separate header/kernel versions, I am
happy with this change. Otherwise, it will be a pain with more full
rebuilds.

Regards, Steve
