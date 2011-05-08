From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 08 May 2011 08:14:40 -0500
Subject: [Buildroot] PATH
Message-ID: <20110508081440.78203647owixiiio@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

I'm almost done with the MySQL 5.5 script, but it requires ./ in the path.
It may not be a bad idea to add this to Makefile.in (TARGET_PATH,  
HOST_PATH), in case other packages have a similar behavior.

Thoughts?
(Worst case I'll just keep it in the mysql.mk)

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
