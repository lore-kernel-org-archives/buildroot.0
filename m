From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:52:45 +0200
Subject: [Buildroot] [PATCH v2] gst1-rtsp-server: new package
In-Reply-To: <1473677421-16673-1-git-send-email-Abhilash.Tuse@imgtec.com>
References: <1473677421-16673-1-git-send-email-Abhilash.Tuse@imgtec.com>
Message-ID: <20160912225245.00b253ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 16:20:21 +0530, Abhilash Tuse wrote:
> From: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
> 
> Based on patch by Phil Edworthy:
> http://lists.busybox.net/pipermail/buildroot/2010-June/035777.html
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
> Signed-off-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
> Signed-off-by: Abhilash Tuse <Abhilash.Tuse@imgtec.com>
> 
> ---
> Changes v1 -> v2:
>   - add optional dependency of libcgroup & gst1-plugins-bad  (suggested by Thomas Petazzoni)
>   - add mandatory dependencies  (suggested by Thomas Petazzoni & Peter Korsgaard)

I've added host-pkgconf to the dependencies, since it's used to detect
gstreamer and libcgroup, and then I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
