From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 01 Apr 2021 18:30:05 +0200
Subject: [Buildroot] [PATCH
 2/2]package/x11r7/xdriver_xf86-video-amdgpu:fix glamor dependency
References: <20200410123207.3145145-1-bernd.kuhls@t-online.de>
 <20200410123207.3145145-2-bernd.kuhls@t-online.de>
Message-ID: <d19hjhx0fs.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 10 Apr 2020 14:32:07 +0200 schrieb Bernd Kuhls:

> Copy glamor dependencies from xserver_xorg-server omitting libgl/libegl
> because this package already depends on both options:
> https://git.buildroot.net/buildroot/tree/package/x11r7/xserver_xorg-
server/xserver_xorg-server.mk#n192
> 
> Fixes:
> http://autobuild.buildroot.net/results/4da/
4da87d30e6f5a10aafae60abce1b89ed92204a4e/
> http://autobuild.buildroot.net/results/74c/
74ceb71bd48ea3a2bf6ff68aec0af76a11662f1f/

Hi,

this patch series[1] is still needed:

http://autobuild.buildroot.net/results/
541/54193d198efe371bdb19ac4981d631ff1e279717//

Regards, Bernd

[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=169608
