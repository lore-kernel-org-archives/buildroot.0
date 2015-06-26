From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:47:15 +0200
Subject: [Buildroot] [PATCH v6 00/16] OpenCV bump
In-Reply-To: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626204715.1043dbfb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 25 Jun 2015 21:59:41 +0200, Samuel Martin wrote:

>   package/opencv: alphabetically sorted each _CONF_OPTS group
>   package/opencv: bump to version 3.0
>   package/gstreamer1/gst1-plugins-bad: disable opencv plugin with
>     opencv-3
>   package/opencv: define modules inter-dependencies
>   package/opencv: reword modules' prompt and help text
>   package/opencv: reduce modules on by default
>   package/opencv: disable all modules by default
>   package/opencv: add python support

Applied.

>   package/opencv: add openmp support

Applied.

For the other patches, I'm waiting for some more review (and some of
the patches have comments from Yann).

Thanks a lot for working on OpenCV!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
