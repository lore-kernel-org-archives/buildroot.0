From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 1 Feb 2007 13:31:19 +0100
Subject: [Buildroot] buildroot svn version failed to build using
	(almost) defconfig(busybox 1.2.2.1)
In-Reply-To: <200702011651.05062.wangbj@lzu.edu.cn>
References: <200702011651.05062.wangbj@lzu.edu.cn>
Message-ID: <20070201123119.GB23185@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 01, 2007 at 04:51:02PM +0800, Wang, Baojun wrote:
>hi,
>
>buildroot failed to build on busybox 1.2.2.1:
>
>cp -dpf /opt/build/buildroot/build_i686/staging_dir/lib/libstdc++.so* /opt/build/buildroot/build_i686/root/lib/
>cp -f  
>target/device/x86/i386/busybox.config /opt/build/buildroot/build_i686/busybox-1.2.2.1/.config

Right. That config is ment for trunk. Please try r17697 or later
