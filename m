From: Yvan Roch <yvan.roch@gmail.com>
Date: Wed, 19 Dec 2012 14:15:48 +0100
Subject: [Buildroot] Bug report in pkg-autotools.mk
In-Reply-To: <20121219133507.058bf1ea@skate>
References: <CAExA2HxbO1X8zt_+Q=BtUhqnWCCSeNGZ3ALR_FhJmhWnpGLBHA@mail.gmail.com>
 <20121219133507.058bf1ea@skate>
Message-ID: <CAExA2Hy-wcfa12o4waVKLK08YdUfgKZO0G6X6oqxLHn_OKnaBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Many thanks for your quick answer.
I will not use a /usr* path until you publish your general patch for .la files.

There are several other .la files with paths pointing to the build directory.
For example: libdirect.la, libfusion.la, libuuid.la, libblkid.la, libpcre.la
But it's not exhaustive, it's in my own build...

Regards,

Yvan.
