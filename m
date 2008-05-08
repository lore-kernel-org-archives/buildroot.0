From: Arun Reddy <reddyac@gmail.com>
Date: Thu, 8 May 2008 15:49:19 -0700
Subject: [Buildroot] ARM build error with llseek.c
Message-ID: <326f33790805081549v3afdc776u56cdeb8e57167782@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I am continuing with my ARM build and I ran into a problem with llseek.c:

http://img211.imageshack.us/img211/6387/e2fsprogsph4.jpg

I found that this problem was reported before:
http://bugs.busybox.net/view.php?id=1548

and the solution seemed to involve enabling large file support in
buildroot's configuration. I did this, but still get the same error. Does
anyone know why LFS needs to be activated and in my case, why it doesn't
resolve this issue? Any help on this problem would be appreciated. Thank
you.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080508/d0bc2df3/attachment.htm 
