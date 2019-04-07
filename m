From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 15:36:53 +0200
Subject: [Buildroot] [PATCH v4] gst1-plugins-good: add option for qmlgl
 plugin (qt5 plugin)
In-Reply-To: <1537268307-5265-1-git-send-email-inigohuguet@fanamoel.com>
References: <1535958840-4452-1-git-send-email-inigohuguet@fanamoel.com>
 <1537268307-5265-1-git-send-email-inigohuguet@fanamoel.com>
Message-ID: <20190407153653.59ada293@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Sep 2018 12:58:27 +0200
I?igo Huguet <inigohuguet@fanamoel.com> wrote:

> gst1-plugins-good is built with --disable-qt option, so qmlgl plugin
> is disabled. Added option to enable it, allowing to use elements
> qmlglsrc and qmlglsink.
> 
> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> 
> ---
> Dependency: this patch depends on the pkgconf bump to version 1.5.3

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
