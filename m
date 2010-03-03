From: Sergey Naumov <sknaumov@gmail.com>
Date: Wed, 3 Mar 2010 16:13:57 +0300
Subject: [Buildroot] Modules architecture
In-Reply-To: <4d28d4b51003030254r2541e9b6k5ef9678a69f35953@mail.gmail.com>
References: <7627a87b1003030251o5313e124ofd6b99e7f0a55cc@mail.gmail.com>
	<4d28d4b51003030254r2541e9b6k5ef9678a69f35953@mail.gmail.com>
Message-ID: <7627a87b1003030513n6103f53agd48bd06599ba4129@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

KERNEL_ARCH variable is set to i386 for my configuration, as I understand it
from Makefile, but as I saw in Makefiles its rather makes influence on paths
to modules than on .config file.
Is it possible to avoid buildroot's interference in the build process of
kernel with standard options, but keep all other useful features of
buildroot (so I want kernel to build on a toolchain, but along with
modules.)?

Sergey.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100303/ebcbcff7/attachment.htm>
