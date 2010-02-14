From: =?ISO-8859-1?Q?Sebasti=E1n_Treu?= <sebastian.treu@gmail.com>
Date: Sun, 14 Feb 2010 04:26:28 -0300
Subject: [Buildroot] backtrace patch and execinfo.h missing on uclibc
Message-ID: <9e4ade691002132326i3d3261afja3e4513ec7c07f07@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have read another threads about it without any success on solve my
problem. I also ask in IRC and gently they told me about a patch. But
without any more information, and I didn't continue asking to don't
bother people there. I don't like to bother anywhere, but I can't
manage to solve my problem.

I patched manually with the patch:
http://repo.or.cz/w/buildroot.git/blob_plain/HEAD:/toolchain/gcc/4.4.1/301-missing-execinfo_h.patch

But execinfo.h does not appears on the include directory. I'm not
really looking for a solution, I mean, If someone tell me that it's
imposible to build that package with uclibc toolchain, then I'll see
what to do. Maybe I'll switch to glibc and make all the systems
again...such a pitty.

I have also tried pasting the execinfo.h file from glibc toolchain
made by the openwrt source without success. It found the file
included, but errors on function definitions arrives.

I thought in building that package only with glibc, and I asked that
on IRC. They told me that it's hard to get it working like that.

If someone can reply this with the no-solution or the solution I will
be pleased.

Thanks in advance,
Best regards,
-- 
If you want freedom, compile the source. Get gentoo.

Sebasti?n Treu
http://labombiya.com.ar
