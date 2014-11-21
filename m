From: Michael Sumulong <msumulong@gmail.com>
Date: Fri, 21 Nov 2014 13:54:58 -0500
Subject: [Buildroot] Patch a buildroot package's libfoo.mk file?
Message-ID: <CABDNR163vv83d7tvOwdQoOs1AGnycts0mNde_fzvHmHvy68+YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using the avahi package that comes with buildroot but there's a
configuration option that I'd like to use (--enable-compat-libdns_sd) that
I don't think the whole buildroot community would need. Is it possible to
apply a patch from a source dir (BR2_EXTERNAL) to package/avahi/avahi.mk
using buildroot patching framework?

Michael Sumulong
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141121/83e9df68/attachment.html>
