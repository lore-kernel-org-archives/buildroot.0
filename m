From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Fri, 21 Feb 2014 20:37:51 +0100
Subject: [Buildroot] udev 182: scsi/scsi.h not found
Message-ID: <5307AB0F.30602@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!
I'm still learning and I was able to fix several issue by myself.
Anyway my first buildroot compilation is not completed yet!

The building of udev 182 ends with the following error:

src/ata_id/ata_id.c:32:23: fatal error: scsi/scsi.h: File o directory 
non esistente
  #include <scsi/scsi.h>
                        ^
compilation terminated.
make[3]: *** [src/ata_id/ata_id.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [all-recursive] Error 1
make[1]: *** [all] Error 2


grep -rn 'scsi' package/ leads to the package libiscsi but selecting it 
doesn't fix the problem.

Thus I'm asking again an hint to put me on the right way.....
Thanks!
Marco
