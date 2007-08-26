From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 27 Aug 2007 00:38:31 +0100
Subject: [Buildroot] [PATCH] Fix qtopia4 compile
In-Reply-To: <d6cda7730708261637u5d62af28ofa3050c8526ca827@mail.gmail.com>
References: <d6cda7730708261637u5d62af28ofa3050c8526ca827@mail.gmail.com>
Message-ID: <d6cda7730708261638n9d8411dn17866dca9fd28271@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ops, forgot attachment, sorry.


On 8/27/07, Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
> Hi,
>
>     This patch fixes qtopia4 compile issues. It failed to build host
> tools due to wrong include paths from CFLAGS/CXXFLAGS. It now builds
> correctly.
>     Also, on AVR32, for some reason make install doesn't copy over
> qatomic_avr32.h which makes projects using qtopia to fail. Added a
> rule at the makefile level. There might be a solution for this by
> patching qtopia, althought as of yet unknown.
>     Btw, this bumps up Qtopia version to 4.3.1 (currently latest) The
> 4.2.2 according to changelogs contains data corruption bug in
> QDatastreams and some memory leaks.
>
> Cheers,
>     Thiago A. Correa
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia4.patch
Type: application/octet-stream
Size: 3048 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070827/e1f9050e/attachment.obj 
