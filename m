From: Vasanth Ragavendran <ragavendra.2007@gmail.com>
Date: Fri, 22 Jul 2011 20:06:31 +0800
Subject: [Buildroot] Crosstool-ng buildroot installing old version tools
Message-ID: <CADfuMF6B3qLE9oUmsXMiZOSeCjOdXXUh16+8ESzBpufhmt0QUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am using buildroot for generating toolchain for my target. However since I
need glibc for it I'm using the toolchain from crosstoolchain-ng in the
toolchain option in make menuconfig of buildroot. However the "crosstool-ng"
the buildroot installs is 1.11.3 and checking the conf file of crosstool-ng
reveals that some of the tools the crosstool-ng uses are pretty old versions
like gcc 4.4.6. It takes these values by default. However i'm trying to
change these versions in the conf file present in
buildroot/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc, while
the crosstool-ng installs in buildroot, it still takes the old values only
for the tools. like i changed the gcc version to 4.5.2
in crosstool-ng.config-glibc from gcc-4.4.6, the buildroot still installs
the 4.4.6 version only and not 4.5.2 why is this happening? Plz help.

Thanks and regards
R.Vasanth Ragavendran.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110722/db77558c/attachment.html>
