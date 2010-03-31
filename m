From: Sasha Sirotkin <buildroot@browserseal.com>
Date: Wed, 31 Mar 2010 13:36:27 +0300
Subject: [Buildroot] output/target/usr/lib/' is not a directory
Message-ID: <4BB325AB.8050801@browserseal.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot compilation fails with the following error

cp -dpf 
/unpackaged/KwikByte/buildroot-2010.02/output/staging/usr/lib/libgettext*.so* 
\
        
/unpackaged/KwikByte/buildroot-2010.02/output/staging/usr/lib/libintl*.so* 
/unpackaged/KwikByte/buildroot-2010.02/output/target/usr/lib/
cp: target 
`/unpackaged/KwikByte/buildroot-2010.02/output/target/usr/lib/' is not a 
directory
make: *** 
[/unpackaged/KwikByte/buildroot-2010.02/output/target/usr/lib/libintl.so] 
Error 1


If I create the directory manually the build continues


Config file attached.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.bz2
Type: application/x-bzip
Size: 3643 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100331/9d7f1e17/attachment.bin>
