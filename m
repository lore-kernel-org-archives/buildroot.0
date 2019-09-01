From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Sep 2019 22:19:19 +0200
Subject: [Buildroot] [PATCH] package/glibc: bump version for additional
 post-2.29 fixes
In-Reply-To: <20190804132429.23425-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 4 Aug 2019 15:24:29 +0200")
References: <20190804132429.23425-1-peter@korsgaard.com>
Message-ID: <871rwz3h2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The following additional bugs are fixed:
 >   [16573] malloc: Set and reset all hooks for tracing
 >   [18035] Fix pldd hang
 >   [20568] Fix crash in _IO_wfile_sync
 >   [24228] old x86 applications that use legacy libio crash on exit
 >   [24476] dlfcn: Guard __dlerror_main_freeres with __libc_once_get (once)
 >   [24744] io: Remove the copy_file_range emulation

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.05.x, thanks.

For 2019.02.x I will instead bump to the latest on the 2.28 branch.

-- 
Bye, Peter Korsgaard
