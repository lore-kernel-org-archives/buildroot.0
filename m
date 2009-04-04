From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 4 Apr 2009 11:03:26 +0200
Subject: [Buildroot] UBIFS confusion
Message-ID: <AC4CD65049C54EDC9F34A00769C5A81F@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ;
 
When i need UBIFS  do i just enable UBI and UBIFS with the default kernel
(currently using 2.6.28.8.)?
 
On http://git.infradead.org/ i saw  <http://git.infradead.org/ubifs-2.6.git>
ubifs-2.6.git ,  <http://git.infradead.org/ubi-2.6.git> ubi-2.6.git , these
seem to be kernel trees with modifications in the ubisfs fs.
 
i am currently using MTD userspace tools from the git repository.(mkfs.ubifs
,ubinize) to create ubifs images.
 
Do i need the to use the kernel tree from
<http://git.infradead.org/ubifs-2.6.git> ubifs-2.6.git or
<http://git.infradead.org/ubi-2.6.git> ubi-2.6.git or can i just use the
default buildroot stuff ?
 
Johan
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090404/4e182de5/attachment.htm>
