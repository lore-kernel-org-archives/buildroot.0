From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Aug 2013 22:59:18 +0200
Subject: [Buildroot] [PATCH] package: add the duma memory debugging
 library
In-Reply-To: <069B5A25F9844945B625ADE7258AC94C061E77EA@4rf-nz-orion.local.4rf.com>
References: <069B5A25F9844945B625ADE7258AC94C061E77EA@4rf-nz-orion.local.4rf.com>
Message-ID: <20130813225918.5f27ce9b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Reuben Dowle,

On Thu, 14 Feb 2013 23:05:53 +0000, Reuben Dowle wrote:
> Add the duma memory debugging library. This is based on an earlier patch by
> Baruch Siach, with minor changes to build for latest buildroot sources.
> 
> Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>

Applied, thanks. Note that I have dropped the no-C++ support, because
it wasn't building here, and I thought it wasn't worth the effort.

If you're really interested in the no-C++ support, feel free to revive
this part of the patch, make it work, and resubmit it.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
