From: grepper <grepper@gmail.com>
Date: Tue, 09 Jun 2015 18:56:17 -0400
Subject: [Buildroot] bc segfaults when using math library, and patch
Message-ID: <55776F11.3080803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have attached a patch that fixes the segfault in bc when it is used
with the math library loaded. A developer on #buildroot also commented
that perhaps buildroot should use the alpha version of bc like many
distros instead - I can't comment on that.

regards,
Robert


-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix_mathlib_segfault.patch
Type: text/x-patch
Size: 464 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150609/0e61a099/attachment.bin>
