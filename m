From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 10 May 2011 10:22:23 -0400
Subject: [Buildroot] (no subject)
Message-ID: <1305037344-22660-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformatted patch to meet the list's guidelines, let me know if I've missed
anything. 

I used IRDA Utils as an example, since I'm not a Makefile expert. Following
their lead, I added CLEAN_CMDS and UNINSTALL_CMDS. Everything appears to work in
my tests. Also, are backticks in Makefiles considered good style?
