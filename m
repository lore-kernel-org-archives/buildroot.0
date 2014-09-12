From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:15:43 +0200
Subject: [Buildroot] [PATCH 01/12] xdriver_xf86-video-vmware: only
	avaiblable on x86
In-Reply-To: <1410537011-29662-2-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:00 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-2-git-send-email-jezz@sysmic.org>
Message-ID: <87zje4bkw0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > ... since BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA is only available on x86.
 > Fix warnings like:
 >   warning: (BR2_PACKAGE_XDRIVER_XF86_VIDEO_VMWARE) selects
 >   BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA which has unmet direct dependencies
 >   (BR2_PACKAGE_MESA3D && (BR2_i386 || BR2_x86_64))

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
