From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 17 Jan 2008 12:40:20 +1100
Subject: [Buildroot] [PATCH] readline overhaul
Message-ID: <20080117014020.GA30067@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

Here's a patch to overhaul the readline package. Changes are:

1. Use BR2_GNU_MIRROR
2. Update to readline 5.2
3. Apply upstream's current patches for 5.2.
4. Remove the 5.1 patches in the tree (which weren't being applied
anyway)

5. Add dependency on ncurses, which existed before but not specified
6. Ensure that libreadline.so is linked to libncurses.so
7. Split out BR2_PACKAGE_READLINE_HEADERS option if you want headers on
the target, ala ncurses.

gzipped as it's too big for the list otherwise.

thanks
Hamish


-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-readline.patch.gz
Type: application/octet-stream
Size: 10366 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080117/1b216b74/attachment.obj 
