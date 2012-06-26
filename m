From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 27 Jun 2012 00:06:41 +0200
Subject: [Buildroot] fails to build host-ncurses
Message-ID: <CAAfyv37nm-iTr78FzpDoNfrG9u7ARE7hnKWQV4vSgMXMN6BdQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My git HEAD is 01d7b429d9a0709ce96f7af892b14398b62d5b22.

I'm trying to build ncurses but it fails with:

ranlib ../lib/libncurses.a
ranlib ../lib/libncurses_g.a
make[2]: Leaving directory
`/home/open-nandra/projects/buildroot/output/build/host-ncurses-5.7/ncurses'
/usr/lib/ccache/gcc ../objects/tic.o ../objects/dump_entry.o
-L/home/open-nandra/projects/buildroot/output/host/lib
-L/home/open-nandra/projects/buildroot/output/host/usr/lib
-Wl,-rpath,/home/open-nandra/projects/buildroot/output/host/usr/lib
-I../progs -I. -DHAVE_CONFIG_H -I. -I../include  -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64  -DNDEBUG
-I/home/open-nandra/projects/buildroot/output/host/usr/include/ncurses
-O2 -I/home/open-nandra/projects/buildroot/output/host/include
-I/home/open-nandra/projects/buildroot/output/host/usr/include
--param max-inline-insns-single=1200 -static -L../lib -lncurses
-L../lib -lncurses -dynamic   -o tic
/usr/bin/ld: cannot find -lc
collect2: error: ld returned 1 exit status
make[1]: *** [tic] Error 1
make[1]: Leaving directory
`/home/open-nandra/projects/buildroot/output/build/host-ncurses-5.7/progs'
make: *** [/home/open-nandra/projects/buildroot/output/build/host-ncurses-5.7/.stamp_built]
Error 2

Am I missing some host libs?

Regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 21060 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120627/56813796/attachment-0001.obj>
