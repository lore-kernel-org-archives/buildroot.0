From: Willy <willy@willygroup.org>
Date: Fri, 27 Jan 2012 08:56:57 +0000 (UTC)
Subject: [Buildroot] gtkmm in buildroot toolchain
Message-ID: <loom.20120127T095631-99@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
I've some program written in c++ and gtkmm. 

Which is the better way to compile them for my embedded system between:

 1. Add (somehow) libgtkmm (and other needed libraries) in buildroot toolchain 
 2. Rewrite entirely my programs with gtk+ (and use always it in future)
 3. Use another graphic library and rewrite all

PS: I need more documentation for buildroot, exist some good book or forum for
rookie users?

Thanks,
Willy
