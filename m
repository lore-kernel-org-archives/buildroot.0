From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 3 Mar 2010 13:51:05 +0300
Subject: [Buildroot] Modules architecture
Message-ID: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello.

There is a problem with kernel building when .config contains processor
architecture that differs from BR2_ARCH. Then kernel will have architecture
as in BR2_ARCH and modules as in .config.
Expectable behavior is to apply BR2_ARCH to both of them, or ignore it.

As a result of the current implementation I got "invalid module format" for
all modules compiled with the kernel.

What should I do to avoid it "through buildroot configs", but not through
changing architecture in kernel config?

Sergey.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100303/7a0395e9/attachment.htm>
