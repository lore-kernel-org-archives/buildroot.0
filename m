From: Aleksandar Simeonov <aleksandar@barix.com>
Date: Wed, 6 Apr 2016 10:44:04 +0200
Subject: [Buildroot] Using packages overrides
Message-ID: <5704CC54.5080007@barix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Could someone help me to understand how to use properly the package 
override in BR? I'm trying to override a BR package by defining the
BR2_PACKAGE_OVERRIDE_FILE="$(BR2_EXTERNAL)/local.mk"

and putting in local.mk the right

PKGFOO_OVERRIDE_SRCDIR = $(BR2_EXTERNAL)/package/override/sysvinit

The problem is that whatever package I try to override, the build 
complains that it has been redefined-once in the original BR2 package 
folder, and second time in the override folder. Am I misinterpreting the 
BR user manual chapter 8.12.6 ? Can we use Config.in and pkgfoo.mk files 
in the override folder, or we have to share those of the original 
package? That wouldn't make anysense, because the user may also need to 
customise the .mk file. What I'm missing/doing wrong ?

Thanks in advance,

Alex Simeonov

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160406/8cc1a7ad/attachment.html>
