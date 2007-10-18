From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 18 Oct 2007 11:36:28 +1000
Subject: [Buildroot] patch: add fconfig package
Message-ID: <20071018013628.GB724@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's a patch to add a package for fconfig.

fconfig is a utility to manipulate RedBoot configuration settings.
I am using it on a project to extract per-board settings eg MAC address,
serial number.

The fconfig implementation comes from:
http://andrzejekiert.ovh.org/software.html.en

My package also adds a patch of my own to allow all configuration items
to be listed.

cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-fconfig.diff
Type: text/x-diff
Size: 7495 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20071018/018123bc/attachment.bin 
