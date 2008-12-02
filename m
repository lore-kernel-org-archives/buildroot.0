From: Joe George <ccjoegml@gmail.com>
Date: Tue, 2 Dec 2008 12:17:05 -0700
Subject: [Buildroot] Compile error: makedevs.c - warnings treated as errors
Message-ID: <7631e7570812021117h254f7bd2r3145bdcca1611ccf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting a compile error due to warnings.  I probably have
something setup wrong but I haven't been able to figure out what.  The
makedevs.c file has not changed from an earlier buildroot snapshot
that compiled.

cc1: warnings being treated as errors
/media/swdev/buildroot/build_powerpc/makedevs/makedevs.c: In function 'main':
/media/swdev/buildroot/build_powerpc/makedevs/makedevs.c:531: error:
ignoring return value of 'system', declared with attribute
warn_unused_result
make: *** [/media/swdev/buildroot/build_powerpc/makedevs/makedevs] Error 1

Any ideas?

Thanks,
Joe
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 18152 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081202/27734c3a/attachment-0001.obj 
