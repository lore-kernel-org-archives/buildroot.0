From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 18 Oct 2007 12:49:14 +1000
Subject: [Buildroot] patch: add fis package
Message-ID: <20071018024914.GA2149@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fis is a tool to manipulate the Redboot partition table from linux.
Upstream source is http://svn.chezphil.org/utils/trunk/fis.c

The patch also adds my code for updating image checksums.

(Note minor overlap with the fconfig patch in Config.in.)

cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-fis.patch
Type: text/x-diff
Size: 12117 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071018/bfb1e73b/attachment.bin 
