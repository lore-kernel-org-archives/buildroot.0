From: Daniel Laird <danieljlaird@hotmail.com>
Date: Fri, 9 Feb 2007 03:36:01 -0800 (PST)
Subject: [Buildroot] Fonts? Where do you get them
Message-ID: <8884124.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I am building an embedded rootfs using Buildroot.
I am not using Xorg I am using GTK and Directfb.

I can get it all to build, etc however where do I get fonts from?
I can copy fonts on my build PC to the target roots
($ROOTFS/usr/share/fonts) and then run fc-cache
on the target and it all works ok.
However I want to know if there is a package i can build (or configure) that
will generate these fonts for me in the target rootfs.
Any help appreciated
Dan
-- 
View this message in context: http://www.nabble.com/Fonts--Where-do-you-get-them-tf3199851.html#a8884124
Sent from the BuildRoot mailing list archive at Nabble.com.
