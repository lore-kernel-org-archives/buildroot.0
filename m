From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jun 2012 00:20:07 +0200
Subject: [Buildroot] [PATCH v2 5/5] opencv: bump to version 2.4.0
In-Reply-To: <1338674987-2053-6-git-send-email-s.martin49@gmail.com>
References: <1338674987-2053-1-git-send-email-s.martin49@gmail.com>
 <1338674987-2053-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20120603002007.0c0d01cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  3 Jun 2012 00:09:47 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> +config BR2_PACKAGE_OPENCV_BUILD_opencv_calib3d
> +	bool "include opencv_calib3d module into the OpenCV build"
> +	default y

We normally use capital letters for options names. And the _BUILD_ part
is, IMO, useless. What about simply:

config BR2_PACKAGE_OPENCV_CALIB3D

or

config BR2_PACKAGE_OPENCV_MODULE_CALIB3D

for this specific case?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
