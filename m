From: Whitney, Scott <scwhitn@amazon.com>
Date: Wed, 9 Oct 2019 14:26:12 +0000
Subject: [Buildroot] Add host packages in br2-external tree?
Message-ID: <1570631172258.59648@amazon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Buildroot members,


We are using a br2-external tree (with BR2_EXTERNAL) to store some target packages/applications and some special files to generate our file system image.


A co-worker and I have searched through the Buildroot manual extensively, and have not found a way to add host packages to a br2-external tree.  There are example on adding target packages through external.mk and Config.in (with package/pkg1/Config.in, etc.), but no examples on how to add special tools that we want to build and install for the host.


It seems like the only mentions of Config.in.host imply that host packages can only be added within the Buildroot tree itself, rather than via a br2-external tree.


Can host packages be added to a br2-external tree?  If so, could you provide a brief example?


Many thanks,


Scott
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191009/5de61e21/attachment.html>
