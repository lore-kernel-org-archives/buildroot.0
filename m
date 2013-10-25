From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Fri, 25 Oct 2013 16:05:24 +0200
Subject: [Buildroot] Name of downloaded archive, conflicts
Message-ID: <20131025160524.4f8e922a@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have encountred a problem when downloading custom kernel together
with a custom (e.g.) u-boot. Both are downloaded from GitHub from a
master branch. The URLs are (in case of using master branches):

 https://github.com/Xilinx/u-boot-xlnx/archive/master.tar.gz
 https://github.com/Xilinx/linux-xlnx/archive/master.tar.gz

and that leads to a file name conflict in the dl/ directory. I end
with linux kernel extracted in the u-boot build directory...

Is there a way in buildroot how to specify a different name after
download is done or another way how to avoid the conflict? I tried to
google a bit, however, without a success.

Regards
Jan Viktorin
