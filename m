From: matthieu castet <castet.matthieu@free.fr>
Date: Thu, 11 Mar 2010 23:04:48 +0000 (UTC)
Subject: [Buildroot] sstrip bug
Message-ID: <loom.20100311T235032-41@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sstrip porting from 
http://www.muppetlabs.com/~breadbox/software/elfkickers.html to multi
endianess/class broke program header patching.

Now Dynamic entry is wrong (it works for linker, but not for tools like readelf)
: the offset is wrong.

you can find a patch and an example at https://dev.openwrt.org/ticket/6847


Thanks
