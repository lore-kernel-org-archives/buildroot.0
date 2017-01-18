From: scsijon <scsijon@lamiaworks.com.au>
Date: Wed, 18 Jan 2017 12:55:49 +1100
Subject: [Buildroot] make menuconfig problem in latest snapshot
Message-ID: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found this error in todays snapshot
--------------------------
# make menuconfig
support/scripts/br2-external: line 111: syntax error near unexpected 
token `"${br2_name}"'
Makefile:197: 
/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk: 
No such file or directory
make: Failed to remake makefile 
`/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/.br-external.mk'.
support/scripts/br2-external: line 111: syntax error near unexpected 
token `"${br2_name}"'
make: *** 
[/initrd/mnt/dev_save/firefox_downloads/buildroot-11/buildroot-20140118-snap/output/build/.br2-external.in] 
Error 2
#
----------------------------

regards
scsijon
