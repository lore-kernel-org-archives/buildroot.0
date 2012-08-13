From: Dirk Lohse <d.lohse@meier-nt.de>
Date: Mon, 13 Aug 2012 11:43:41 +0200
Subject: [Buildroot] Login with user fails
Message-ID: <3C32AECB8207924A9A228348325DB2D290500A@mntserv.meier-nt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can't login with other user than root.

 

I can give root an password and can login over serial or ssh. But I
can't add a new user and login with this one.

 

What I've done:

# whoami

root

# adduser test

New password: 123456

Retype password: 123456

# su test

Killed

# echo $?

137

# exit

Welcome to Buildroot...

tx28 login: test

Password: 123456

 

Welcome to Buildroot...

 

 

rootfs is mounted in r/w

 

Thank you.

 

bye

 

Dirk

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120813/4abab993/attachment.html>
