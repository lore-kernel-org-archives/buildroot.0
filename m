From: Brad House <brad@mainstreetsoftworks.com>
Date: Sun, 19 Aug 2007 13:29:54 -0400
Subject: [Buildroot] [patch] soekris net4801 config updates
Message-ID: <46C87E12.1000101@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't need a specific busybox config or a specific
uClibc config for net4801, the standard buildroot configs
for these work great, so remove:

target/device/Soekris/uClibc.config
target/device/Soekris/busybox.config

Also, I've updated the kernel config to 2.6.22.1 ...

Please apply the attached patch (gzipped for size)
and remove the afore-mentioned files.

Thanks.
-Brad
-------------- next part --------------
A non-text attachment was scrubbed...
Name: net4801.patch.gz
Type: application/gzip
Size: 7762 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070819/c04cf7b8/attachment.bin 
