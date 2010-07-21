From: JNY <jny0@hotmail.com>
Date: Tue, 20 Jul 2010 23:23:50 -0700 (PDT)
Subject: [Buildroot]  Build failed with Error 1 and Error 2
Message-ID: <29222293.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

After many hours (around 4) of running, my buildroot ultimately failed with
the following errors, any ideas?

/home/JB/Apps/buildroot-2010.05/output/staging/usr/include/scsi/scsi.h:148:
error: expected specifier-qualifier-list before 'u8'
/home/JB/Apps/buildroot-2010.05/output/staging/usr/include/scsi/scsi.h: In
function 'scsi_varlen_cdb_length':
/home/JB/Apps/buildroot-2010.05/output/staging/usr/include/scsi/scsi.h:159:
error: 'struct scsi_varlen_cdb_hdr' has no member named
'additional_cdb_length'
make[3]: *** [fdisksunlabel.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: Leaving directory
`/home/JB/Apps/buildroot-2010.05/output/build/util-linux-2.13-pre7/fdisk'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/JB/Apps/buildroot-2010.05/output/build/util-linux-2.13-pre7'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/JB/Apps/buildroot-2010.05/output/build/util-linux-2.13-pre7'
make: ***
[/home/JB/Apps/buildroot-2010.05/output/build/util-linux-2.13-pre7/misc-utils/chkdupexe]
Error 2

-- 
View this message in context: http://old.nabble.com/Build-failed-with-Error-1-and-Error-2-tp29222293p29222293.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
