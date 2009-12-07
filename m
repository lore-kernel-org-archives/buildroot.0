From: Joachim Pihl <jpihl@nevion.com>
Date: Mon, 7 Dec 2009 13:36:15 +0100
Subject: [Buildroot] busybox-menuconfig alternate configurations
Message-ID: <op.u4kimpj1yqa4qb@jap-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Saving alternate configurations is a pain in the neck. make *-menuconfig  
insists on saving alternate configurations in the output directory.  
Prepending "./" to the file name does not save it where I run make from,  
and adding "~/<full path>/" gives an error message.

I don't know which project to blame, buildroot or busybox?


-- 
Using Opera's revolutionary e-mail client: http://www.opera.com/mail/
