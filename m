From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 12:41:42 +0100
Subject: [Buildroot] [PATCH 1/2] udev: replace UDEV_ALL_EXTRAS with more
 fine-grained options
In-Reply-To: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
References: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20130324124142.2aa5541c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Tue, 17 Apr 2012 12:19:12 +0200, Sven Neumann wrote:
> Replace the BR2_PACKAGE_UDEV_ALL_EXTRAS options with a bunch of
> configuration choices that allow more fine-grainded control over
> the features that should be built into udev.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>

This patch is rather old, and with the movement around systemd/udev, I
don't think there is really too much incentive to put efforts into the
legacy udev package. Therefore, I've removed this patch, as well as
your PATCH 2/2 that depended on this one, from the patchwork.

If you're still interested by this feature, do not hesitate to come
back with updated versions of those patches, taking into account the
comments that were raised during the review.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
