From: Wade Berrier <wberrier@gmail.com>
Date: Fri, 25 Jul 2008 09:48:06 -0600
Subject: [Buildroot] [PATCH] Samba: mmap & fcntl checks
Message-ID: <bbbeeccd0807250848w3849113cv71ad67f7cebc0acf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here's a patch that adds hard checks for mmap and fcntl.  It makes
samba perform better.

(Also is included in the init.d script to create /var/lock/subsys
which it refers to).

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-samba_mmap_fcntl-create_dir.patch
Type: text/x-diff
Size: 759 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080725/7e81a5f0/attachment.patch 
