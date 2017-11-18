From: Ran Shalit <ranshalit@gmail.com>
Date: Sat, 18 Nov 2017 22:13:32 +0200
Subject: [Buildroot] Deploy NFS rootfs
Message-ID: <CAJ2oMhKdX3x4ujPknQ+wDnvj__pQGoYJOLA=fJNEfh6Vd-=zyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

How should we deploy nfs filsystem.
I understand it should not be from /output/target, because of the
THIS_IS_NOT_YOUR_ROOT_FILESYSTEM warning.
But How should it be done ?

Do I need to generate tar from /output/target with different
ownership/privilege ?

Regards,
Ran
