From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:26:41 +0200
Subject: [Buildroot] [PATCH 00/10] Enable SELinux Support in Existing
 Packages
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908182641.06c78a78@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:14 -0500, Ryan Barnett wrote:
> This is the second set (of three) of patches to add SELinux support in 
> buildroot. This patch set adds support for SELinux to existing packages
> in buildroot. This patch set is meant to be a follow-up to Clayton 
> Shotwell's submission of "SELinux Buildroot Additions".
> 
> In order to be able to test build existing packages with SELinux support, 
> Clayton Shotwell's SELinux Buildroot Additions must first be applied.

Thanks for those patches. I have some specific comments on some of
them, but I wanted to say that generally speaking, they look good. So
as soon as the previous patch series (which is a little bit more
complicated) gets merged, we will be able to merge those ones easily.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
