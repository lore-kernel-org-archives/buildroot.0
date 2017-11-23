From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 09:58:57 +0100
Subject: [Buildroot] [PATCH 1/1] motion: bump to version 4.1
In-Reply-To: <20171119142641.1867-1-fontaine.fabrice@gmail.com>
References: <20171119142641.1867-1-fontaine.fabrice@gmail.com>
Message-ID: <20171123095857.2cf74814@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Nov 2017 15:26:41 +0100, Fabrice Fontaine wrote:
> - Remove 0001-configure.ac-use-given-CFLAGS-LIBS-for-mysqlclient-l.patch,
> it does not have been sent upstream but issue has been fixed by
> https://github.com/Motion-Project/motion/commit/3b7164f7f9c2b123f850f8cd1bc0a860ca51c0fe#diff-67e997bcfdac55191033d57a16d1408a
> - 0002-Rename-base64_encode.patch has been integrated into this version
> - --without-jpeg-turbo has been deleted from configure.ac
> - libsdl dependency has been removed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This already caused a build failure:

  http://autobuild.buildroot.net/results/655/65534775c5977e2424c5f5c63c46f9d0f39d7e1b/build-end.log

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
