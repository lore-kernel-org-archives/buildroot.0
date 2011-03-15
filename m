From: bao bui <buiqbao@gmail.com>
Date: Tue, 15 Mar 2011 02:55:20 -0700
Subject: [Buildroot] buildroot directive for acyion after configuring
Message-ID: <AANLkTi=iLXet_5auTP_mp1KzsY9wr=FOQVRNVZk+Q0dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am cross compiling ghost script. Before the configure process, I can apply
my patch by adding the POST_EXTRACT_HOOKS directive as following

define ESPGS_PATCH_CROSS_COMPILE
    toolchain/patch-kernel.sh $(ESPGS_DIR) package/espgs/ \*.patch
endef

ESPGS_POST_EXTRACT_HOOKS += ESPGS_PATCH_CROSS_COMPILE


But after configuring, I want to modify the Makefile which is just
generated. What directive can I add to the .mk file
PS: I can not modify the configure and the Makefile.in in this case

Many thanks

BAO
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110315/ff1b331a/attachment.html>
