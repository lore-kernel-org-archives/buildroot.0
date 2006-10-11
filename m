From: David Lambert <dave@lambsys.com>
Date: Wed, 11 Oct 2006 07:56:12 -0500
Subject: [Buildroot] libgcc_s.so.1 missing from filesystem
Message-ID: <452CE9EC.4050101@lambsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built several utilities including python using buildroot. A commom 
problem seems to be that they depend on a library libgcc.so.1 which 
appears in buildroot/build_arm/staging_dir/lib/libgcc_s.so.1, but does 
not get transferred to the target filesystem. Manually moving it to the 
target appears to be a workaround. Is there a more elegant solution? 
What is this library?

Regards,

Dave.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dave.vcf
Type: text/x-vcard
Size: 288 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061011/9a160e44/attachment.vcf 
