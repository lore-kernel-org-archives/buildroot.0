From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Feb 2015 17:50:41 +0100
Subject: [Buildroot] Qt5 + OPENGL
In-Reply-To: <75EEE06A0FB7478EA7D2185032B5E93F@JohanW7>
References: <75EEE06A0FB7478EA7D2185032B5E93F@JohanW7>
Message-ID: <20150213175041.111e42f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Fri, 13 Feb 2015 15:20:18 +0100, Sagaert Johan wrote:

> While trying to get Qt5 running with OpenGL: (egl)

Please indicate which platform you are using. Looking at the name of
your defconfig, it seems you're using an i.MX6 Karo platform.

The support for OpenGL on i.MX6 is still not merged in Buildroot, see
the patches from J?r?me Pouiller in patchwork.

Notice that the Vivante user-space OpenGL drivers require glibc, so you
will have to switch to glibc instead of uClibc.

My colleagues have successfully tested J?r?me patches very recently,
and they just work fine, as long as you're using a kernel based on
Freescale 3.10.17 kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
