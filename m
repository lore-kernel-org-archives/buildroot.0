From: Mirek23 <miroslaw.dach@psi.ch>
Date: Mon, 2 Mar 2009 06:28:05 -0800 (PST)
Subject: [Buildroot]  error when building screen
Message-ID: <22289100.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear All,

I am trying to build buildroot toolchain for mips architecture. I have
configured buildroot to include screen program. Unfortunately when building
the executables and libraries I have got an error:

rm -rf
/root/buildroot-2009.02/buildroot-2009.02/project_build_mips/uclibc/buildroot-config
mkdir -p /root/buildroot-2009.02/buildroot-2009.02/project_build_mips/uclibc
cp -dpRf package/config/buildroot-config
/root/buildroot-2009.02/buildroot-2009.02/project_build_mips/uclibc/buildroot-config
>>> screen 4.0.2 Extracting
tar: unrecognized option `--strip-components=1'
Try `tar --help' for more information.
make: ***
[/root/buildroot-2009.02/buildroot-2009.02/build_mips/screen-4.0.2/.stamp_extracted]
Error 2

Does anybody have an idea what could be wrong?

Best Regards

Mirek

-- 
View this message in context: http://www.nabble.com/error-when-building-screen-tp22289100p22289100.html
Sent from the BuildRoot mailing list archive at Nabble.com.
