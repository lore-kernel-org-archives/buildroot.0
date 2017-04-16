From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 17:05:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: depends on
 BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170416114135.5080-1-bernd.kuhls@t-online.de>
References: <20170416114135.5080-1-bernd.kuhls@t-online.de>
Message-ID: <20170416170537.5eee03e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 13:41:35 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/5a2/5a2a7f24c8727f7f3aee2ca72b4472f261610c27/

In a patch sent yesterday, you made ffmpeg link against libatomic. It's
a bit weird that it also uses the __sync built-ins. Does it use
both __atomic and __sync built-ins? In all configurations? On all
architectures?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
