From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Apr 2021 23:17:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati:
 add missing dependency
In-Reply-To: <20210402060939.643516-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Apr 2021 08:09:39 +0200")
References: <20210402060939.643516-1-fontaine.fabrice@gmail.com>
Message-ID: <877dlb6tv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure which is raised since commit
 > a3aac6d84713db7e6d2683eabf965eae21ce48bf:

 > WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 >   Depends on [n]: BR2_PACKAGE_MESA3D [=y] && (BR2_i386 [=n] || BR2_x86_64 [=n])
 >   Selected by [y]:
 >   - BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI [=y] && BR2_PACKAGE_XORG7 [=y] && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR [=y] && BR2_PACKAGE_MESA3D [=y]

 > Fixes:
 >  - http://autobuild.buildroot.org/results/36773085f933ab2ee558f53a6c0ae5365077ad5e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
