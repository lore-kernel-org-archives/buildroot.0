From: Dirk Lohse <d.lohse@meier-nt.de>
Date: Tue, 24 Jul 2012 16:51:09 +0200
Subject: [Buildroot] Buildroot 2012.02 new user can't login,
	su exit with errno 137
Message-ID: <3C32AECB8207924A9A228348325DB2D2904EDF@mntserv.meier-nt.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i build an embedded system based on Karo TX28 with Kernel 3.3.

All works fine, but I can't login with other user accounts than root.
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

Can anybody help me to solve this issue?

Thanks
--
Dirk Lohse
