From: Will Newton <will.newton@gmail.com>
Date: Wed, 19 Mar 2008 17:31:01 +0000
Subject: [Buildroot] [PATCH] Update libtool config.sub before building
Message-ID: <87a5b0800803191031x3dc2a940p7f741f54e99cdf69@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This patch runs $(CONFIG_UPDATE) on the libtool tree before trying to
build libtool. This is necessary if the config.sub shipping with
libtool does not contain all the features for your target
architecture.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libtool-config-update.patch
Type: text/x-diff
Size: 680 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080319/47751b69/attachment.patch 
