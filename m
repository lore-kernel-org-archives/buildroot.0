From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 4 Dec 2010 11:13:01 -0600
Subject: [Buildroot] external toolchain and iconv in libglib2.mk
Message-ID: <003201cb93d6$8162a080$8427e180$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

 

I'm using crosstools-ng (configured as external toolchain) with iconv
support.

 

The host-libglib2 compile fails without the line:

HOST_LIBGLIB2_CONF_OPT += --with-libiconv=gnu

 

I'm not sure how to fix this correctly, any suggestions?

 

-- 

 

Regards

   Heiko Zuerker

    <http://www.devil-linux.org> http://www.devil-linux.org

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101204/49b67ac1/attachment.html>
