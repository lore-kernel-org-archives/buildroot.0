From: Francisco Gonzalez Morell <gzmorell@gmail.com>
Date: Wed, 24 Feb 2010 00:01:39 +0100
Subject: [Buildroot] qt package patch
Message-ID: <201002240001.39372.gzmorell@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attached is a patch for qt package. It solves a simple failure. Here is a 
little description:
This package includes a patch for qt version 4.5.2. But the present version is 
4.5.3. The patch can not be applied, being still necessary for version 4.5.3.
The patch works for 4.5.3 with simply changing file name, and the file names of 
the files to apply the patch.

Francisco
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-the-patch-name-for-qt-4.5.3-version.patch
Type: text/x-patch
Size: 2539 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100224/6dff5bb0/attachment.bin>
