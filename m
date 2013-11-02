From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Nov 2013 19:01:11 +0100
Subject: [Buildroot] [PATCH 2/2] libnl: do not allow to build tools on
 static lib configs
In-Reply-To: <1383387986-9508-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383387986-9508-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383387986-9508-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLB1j8BTSHpFjgRanE97JoPuZ6YKD8=E19BKFmuxnZYQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/2 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Building the libnl tools requires the <dlfcn.h> header, which is not
> compatible with static only builds. Therefore, this commit makes the
> libnl tools option depend on !BR2_PREFER_STATIC_LIB.
>
> Fixes:
>
>
> http://autobuild.buildroot.org/results/573/57340b9bd2db3a523836e02e01cba6f7c17c8ca7/build-end.log
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131102/fb0be977/attachment.html>
