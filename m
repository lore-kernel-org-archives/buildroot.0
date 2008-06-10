From: Christopher Taylor <chtaylo3@gmail.com>
Date: Tue, 10 Jun 2008 15:54:55 -0400
Subject: [Buildroot] root login password
Message-ID: <2590773a0806101254u4444c68dxe04f4dd117fef179@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some builds root needs to supply a password for logging in over
telnet or through g_serial  and on some builds it doesn't.  No matter
what, it can always login without the password on the debug serial
(ttyS3 for me).

Has anyone else had this problem of can anyone suggest where I can
look.  Unfortunately, I do not have old conifgs to compare against :(

-Chris
