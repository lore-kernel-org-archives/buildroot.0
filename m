From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 20 Oct 2007 21:30:08 +0300
Subject: [Buildroot] mkfs.jffs2.c:69:21: error: sys/acl.h: No such file
 or	directory
In-Reply-To: <20071020191113.9hu3pqcnk80k0ws4@webmail.ntnu.no>
References: <20071020191113.9hu3pqcnk80k0ws4@webmail.ntnu.no>
Message-ID: <471A4930.7060006@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Has anyone else had this problem? How do you fix it?
> 
> Regards,
> Bj?rn Forsman, Student, Norway
> 

Best way is to install
libacl-devel
lzo-devel
packages on to your host system.


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
