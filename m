From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 16 Sep 2013 11:34:36 +0200
Subject: [Buildroot] build error since a change in apply-patches.sh
Message-ID: <9F3B5AF9F17649E5A569DE606814A046@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Build error

........
>>> liblockfile 1.08 Extracting
gzip -d -c /home/johan/dl/liblockfile_1.08.orig.tar.gz | tar --strip-components=1 -C
/home/buildroot12git/output/build/liblockfile-1.08  -xf -
>>> liblockfile 1.08 Patching package//liblockfile
support/scripts/apply-patches.sh /home/buildroot12git/output/build/liblockfile-1.08 /home/johan/dl liblockfile_1.08-4.debian.tar.bz2
Unsupported format file for
/home/buildroot12git/output/build/liblockfile-1.08/.patches-liblockfile_1.08-4.debian.tar.bz2-unpacked/debian/changelog
make: *** [/home/buildroot12git/output/build/liblockfile-1.08/.stamp_patched] Error 1


I think something is not right in commit d245fbb41dc148a956df59658cc0dc1262612e09 
( apply-patches.sh: detect missing patches)


Sagaert Johan
