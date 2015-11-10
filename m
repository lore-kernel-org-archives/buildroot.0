From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Tue, 10 Nov 2015 11:39:59 -0700
Subject: [Buildroot] Building new package with "make <pkg>"
Message-ID: <564239FF.3030602@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I see from the top-level Makefile "help" that I should be able to run 
"make <pkg>" to build only a target package and its dependencies in 
Buildroot.  I added a new package to Buildroot, but when I run the make 
command to build only it, the tools seem to be doing a complete build 
(kernel, all target packages, filesystem, etc).  What do I need to do to 
be able to build the package by itself?

-- 
Thanks,
David

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 2416 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151110/b4e26207/attachment.p7s>
