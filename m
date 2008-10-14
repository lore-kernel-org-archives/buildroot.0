From: Daniel Lerch <dlerch@gmail.com>
Date: Tue, 14 Oct 2008 10:30:57 +0200
Subject: [Buildroot] grub: bad url
Message-ID: <88372fcb0810140130xd44cdecwbe573285f4ef4b3c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Grub don't work because the url:

http://ftp.debian.org/debian/pool/main/g/grub/grub_0.97-35.diff.gz

is not correct


$ cat target/x86/grub/grub.mk | grep diff
GRUB_PATCH:=grub_0.97-35.diff.gz


Please, check it.

-- 
Daniel Lerch
project: www.opendomo.com
blog: h4ck1t.blogspot.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081014/85226a62/attachment.htm 
