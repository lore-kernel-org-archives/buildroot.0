From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Fri, 20 Mar 2020 06:59:43 -0300
Subject: [Buildroot] Problem with bison relocation in a buildroot generated
 toolchain
Message-ID: <CACjc_5q0E4cq7WjB2oaqT3Uz+G+jyrbNpPsTrqAAipApPVyRKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

First, congratulations for this great project.

Recently I have built a toolchain for an ARM processor, and had a
relocation failure with bison: The problem manifests in kernel compilation
when performed in a different machine than the one that originally
generated the toolchain, or of course, if you delete or rename the original
buildroot folders where the toolchain has been generated,

The bug has been reported here:

https://bugs.buildroot.org/show_bug.cgi?id=12656

Best regards,
Marcelo.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200320/fe384c2e/attachment.html>
