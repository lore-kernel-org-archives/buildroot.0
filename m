From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jun 2010 15:09:55 -0300
Subject: [Buildroot] [PATCH] rsync build fix
Message-ID: <4C1BB673.7080202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Rsync fails to build with a central config cache enabled since
ac_cv_type_struct_sockaddr_storage is wrong thus redefining the
sockaddr_storage struct.
Please test and commit.

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-rsync-fix-build-failure-with-config-cache.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100618/8cf7a1c2/attachment.ksh>
