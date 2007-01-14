From: David Lambert <dave@lambsys.com>
Date: Sun, 14 Jan 2007 15:24:46 -0600
Subject: [Buildroot] Revision 17304 broken?
Message-ID: <45AA9F9E.4080709@lambsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FYI

I just updated to revision 17304 on a separate machine and got the 
following error:

package/Config.in:67 can't open file "package/hal/Config.in"

Commenting out the offending line works fine.

Regards,

Dave.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: dave.vcf
Type: text/x-vcard
Size: 288 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070114/1b45a967/attachment.vcf 
