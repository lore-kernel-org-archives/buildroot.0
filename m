From: David Bonnin <dboml@free.fr>
Date: Thu, 13 Sep 2012 23:00:04 +0200
Subject: [Buildroot] build an "autotooled" that is out of tree
Message-ID: <50524954.2070101@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

We have a projet that out of the buildroot tree.
This projet is build with autotools.

When we run .configure script of our projet, we need to set a lot of env 
variable and pas os it to ./configure.

Is there a way to do that?
Or what is the good way to manage a projet out of tree?

#pwd
/home/toto/src/myPrj
#source ~/buildroot/output/env
#./configure
#make install

David Bonnin
