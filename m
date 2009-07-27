From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Mon, 27 Jul 2009 14:42:34 +0200
Subject: [Buildroot] Incomplete boot
Message-ID: <3EE4FC29CAED43DC83B59C2DFD378777@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

[PPC/Buildroot/busybox/uClibc setup]

Not sure where to post this, but I have a bunch of embedded cards and 
sometimes the boot doesn't complete (some of the /etc/init.d/ scripts are 
not launched). I'm trying to figure out the cause as it seems completely 
random. The only thing different in the logs is the following:

Jul 27 12:00:08 genepi19 user.notice kernel: klogd: exiting
Jul 27 12:00:09 genepi19 syslog.info syslogd exiting


NFS is not completely reliable. I see a whole bunch of the following 
messages but tracking the cause a couple months back proved fruitless:

Jul 27 12:01:40 genepi19 user.notice kernel: [   77.765353] nfs: server 
192.168.1.185 not responding, still trying
Jul 27 12:01:40 genepi19 user.notice kernel: [   77.773426] nfs: server 
192.168.1.185 OK
-- 
Guillaume Dargaud
http://www.gdargaud.net/ 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3562 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090727/d3567030/attachment.bin>
