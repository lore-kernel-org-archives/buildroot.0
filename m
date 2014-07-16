From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 23:03:09 +0200
Subject: [Buildroot] [PATCH v2 00/24] Scientific libraries
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140716230309.5cec9761@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 23 Apr 2014 01:15:32 +0200, Samuel Martin wrote:

>   opencv: bump to version 2.4.8

Applied.

>   opencv: add license details

Was already done by Gustavo.

>   opencv: sort and reorder CMake configuration flags
>   opencv: sort and reorder HW support options
>   opencv: sort and reorder SW support options
>   opencv: add superres module knob
>   opencv: disable apps module
>   opencv: disable opencl support/module
>   opencv: disable OpenMP support
>   opencv: enable SSE4.1 SSE4.2 support when available

All these ones applied.

>   opencv: rework V4L/libv4l support

This one had comments from Yann that have never been addressed. Please
resend an updated version that takes into account these comments. In
the mean time, I've marked this patch as "Changes Requested" in
patchwork.

>   opencv: add jasper support

Applied.

>   opencv: add Qt5 support
>   opencv: add python/numpy support
>   opencv: define modules inter-dependencies
>   opencv: add hidden symbol BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
>   vlc: add opencv support
>   gst1-plugins-bad: rework opencv plugin dependencies

All those patches have pending comments from the review made by Yann a
long time ago, and those comments were never addressed. Could you
please address those comments, and send a new version of the patch
series on top of master? In the mean time, I've marked those patches as
"Changes Requested" in patchwork.

Also, please look for the autobuilder results in the next days to fix
any numpy or opencv related failure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
