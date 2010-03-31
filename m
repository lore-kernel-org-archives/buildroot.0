From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 21:03:30 +0300
Subject: [Buildroot] uClibc snapshot does not work
Message-ID: <4BB38E72.6060102@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I chose uClibc snapshot the compilation fails with the following 
message:

bzcat /unpackaged/KwikByte/buildroot-2010.02/dl/uClibc-snapshot.tar.bz2 
| tar -C /unpackaged/KwikByte/buildroot-2010.02/output/toolchain  -xf -
touch 
/unpackaged/KwikByte/buildroot-2010.02/output/toolchain/uClibc-snapshot/.unpacked
touch: cannot touch 
`/unpackaged/KwikByte/buildroot-2010.02/output/toolchain/uClibc-snapshot/.unpacked': 
No such file or directory
make: *** 
[/unpackaged/KwikByte/buildroot-2010.02/output/toolchain/uClibc-snapshot/.unpacked] 
Error 1
