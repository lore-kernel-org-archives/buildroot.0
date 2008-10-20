From: Hai Zaar <haizaar@haizaar.com>
Date: Mon, 20 Oct 2008 03:13:34 +0200
Subject: [Buildroot] Can not compile strace
Message-ID: <76d9e2a30810191813s629af379kedd4da294a8f7cf2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm building current buildroot with 2.6.27 for at91sam9260

strace fails to compile with the following error:
file.c:41:26: error: linux/dirent.h: No such file or directory

It looks like build_arm/staging_dir/usr/include/linux/dirent.h does
not exist any more.
How can I fix that?

-- 
Zaar
