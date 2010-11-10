From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 10 Nov 2010 16:43:29 +0200
Subject: [Buildroot] module-init-tools fails to compile on host
Message-ID: <AANLkTik4O2xjF0tfOyUWFof2qCwWDcsHxZVc4A-C7fk=@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See attached log. IMO it wouldn't fail if autoreconfigure was done...
However it is specified in module-init-tools.mk:
HOST_MODULE_INIT_TOOLS_AUTORECONF=YES
-------------- next part --------------
A non-text attachment was scrubbed...
Name: module-init-tools.log
Type: text/x-log
Size: 4802 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101110/11448128/attachment.bin>
