From: Jan Pohanka <xhpohanka@gmail.com>
Date: Tue, 16 Jul 2013 11:55:03 +0200
Subject: [Buildroot] custom linux headers from custom kernel
Message-ID: <51E51877.4080004@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

in our project using buildroot we are using a heavily patched kernel, 
which is retrieved form our GIT server. Thanks to buildroot this can be 
set up very easily. All is compiled by Codesourcery toolchain.

The kernel contains also a number of modules with own ioctls, so we need 
to use specific headers. I have found a *linux-headers* package, which 
installs own headers into staging directory, however there are also 
options using official headers or the ones from local kernel snapshot. 
Is there please any reason while there is no option for do 
headers-install from the kernel built by buildroot? If not I would 
prepare a patch adding this possibility into linux-headers package.

thanks
Jan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130716/8bec131b/attachment.html>
