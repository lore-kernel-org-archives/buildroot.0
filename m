From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Thu, 23 Jan 2020 11:56:03 +0000
Subject: [Buildroot] Upcoming glibc-2.31 breaks busybox, strace.
Message-ID: <BN8PR12MB28683E6EF9441AEBAB2CF685D90F0@BN8PR12MB2868.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

In February 2020 the new release of glibc is going to happen. There are at least two packages known which latest releases
fail to build with latest revision of glibc: Busybox and strace.

For "strace" there is a patch in master branch which solves the error:
https://github.com/strace/strace/commit/9afd83c11cb78a04954daaedb54b20214a35ec9c

For busybox there are at least two patches required:
https://git.buildroot.net/busybox/commit/?id=6937487be73cd4563b876413277a295a5fe2f32c
https://git.buildroot.net/busybox/commit/?id=d3539be8f27b8cbfdfee460fe08299158f08bcd9

Should we introduce these patches now or should we wait until glibc-2.31 is introduced in buildroot?



Best regards,
Evgeniy Didin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200123/7b2f5136/attachment.html>
