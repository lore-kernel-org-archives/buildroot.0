From: Simon Pasch <fpasch@googlemail.com>
Date: Tue, 1 Apr 2008 16:37:39 +0200
Subject: [Buildroot] thttpd-package more clean-up
Message-ID: <f90898420804010737l75ea4bbfr7fc675dd1cb8229a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After sending the last patch, I realized, that the files

package/thttpd/S90thttpd
package/thttpd/thttpd.conf

aren't used anymore. So they could be removed from the repository...


The attached patch is just a little cosmetic...
-------------- next part --------------
A non-text attachment was scrubbed...
Name: thttpd2.patch
Type: text/x-patch
Size: 928 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080401/77cce534/attachment.bin 
