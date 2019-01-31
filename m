From: David Picard <dplamp@gmx.com>
Date: Thu, 31 Jan 2019 19:12:36 +0100
Subject: [Buildroot] how to init environment for non-login shell ?
Message-ID: <a02fffcb-b5ca-145d-f363-8e63bf3cdbfb@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have set BR2_INIT_BUSYBOX=y.

In login shells, no problem : /etc/profile and ~/.profile are sourced. 
But in non-login shells (xterm in Xorg + Fluxbox), they aren't. The 
$HOME variable isn't even set. How can I fix this ?

To check what shell I'm in :
$ echo $0
sh??? ??? ??? ??? ??? --> non-login shell
$ echo $0
-sh??? ??? ??? ??? ??? --> login shell

- David
