From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jan 2012 09:25:45 +0100
Subject: [Buildroot] [PATCH 7/7] sam-ba: new package with host variant
 only
In-Reply-To: <201201130013.13601.arnout@mind.be>
References: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
 <1325510735.2442.2.camel@emblysd024.adetel.com>
 <20120102142959.0abeedb8@skate> <201201130013.13601.arnout@mind.be>
Message-ID: <20120113092545.7aac96a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 13 Jan 2012 00:13:13 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  Buildroot is missing post-image scripting in general.  You will
> typically want to package the kernel and rootfs in a compressed and
> signed image that can be distributed and installed on the target.  Or
> during development, you would like to untar it to the nfsroot.

For one project, I have added a post-image script hook, like we have
for post-build. I've used it to generate a firmware image in a special
format, bundling the kernel image and the root filesystem image.

Does it make sense to submit such a feature?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
