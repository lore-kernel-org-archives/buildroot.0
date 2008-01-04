From: Claus Klein <claus.klein@arcormail.de>
Date: Fri, 04 Jan 2008 18:43:01 +0100
Subject: [Buildroot] [patch] busybox should hide generic dev tools for target
Message-ID: <477E7025.3070503@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

in my opinion, the busybox tools should hide the generic development 
packages for the target.

For me, tar and find may be a needed as original gnu package, because 
some packages need stange options.
But it is optional to deselect BR2_PACKAGE_BUSYBOX_HIDE_OTHERS and 
BR2_TARGET_GENERIC_DEV_SYSTEM
again for manual selections.

So here is a patch if someone is interested in.

claus

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: busbox_hide_generic_pkgs.diff
Url: http://busybox.net/lists/buildroot/attachments/20080104/ab6576cb/attachment.diff 
